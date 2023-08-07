using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;
using UnityEngine.UI;

public class RatingPopup : Popup
{
    public List<GameObject> stars;
    private int count = 0;
    public GameObject hand;
    public Text txt_title;

    private void OnEnable()
    {
        txt_title.text = $"Enjoying {Application.productName}?";
        if (UIController.instace.sound == 1)
        {
            GetComponent<AudioSource>().Play();
        }
    }

    public void SelectStar(int count)
    {
        this.count = count;
        for (int i = 0; i < stars.Count; i++)
        {
            stars[i].SetActive(i < count);
        }
        hand.SetActive(false);
    }
    public void RateUs()
    {
        if (count >= 4)
        {
            Application.OpenURL($"https://play.google.com/store/apps/details?id={Application.identifier}");
        }
        else
        {
            UIController.instace.NotiPopup.ShowNoti("Thank you!", true);
        }

        UIController.instace.rate_use = true;
        Hide();
    }
}

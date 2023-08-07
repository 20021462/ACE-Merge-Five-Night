using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class BonusRW : MonoBehaviour
{
    public Text[] txtBonus;
    public ArrowBonus arrow;
    public long reward;

    private void Awake()
    {
        arrow.onChangeBonus = Change;
    }

    private void Change()
    {
        SoundControl.instance.PlayShot(SoundControl.instance.reward_click);
        txtBonus[0].transform.DOScale(1.1f, 0.1f).OnComplete(() =>
        {
            txtBonus[0].transform.DOScale(1, 0.1f);
        });
        foreach (var text in txtBonus)
        {
            reward = WinPopup.coin * arrow.bonus;
            
            if (reward < 5000)
            {
                text.text = (reward).ToString();
            }
            else text.text = (reward).GetNumberAroundString();
        }
    }


}

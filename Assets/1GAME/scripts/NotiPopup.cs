using System;
using DG.Tweening;
using UnityEngine.UI;
using UnityEngine;

public class NotiPopup : MonoBehaviour
{
    public Text txtNoti;
    public RectTransform main;
    public Color successColor, failColor;
    private Tween tweenDelay;
    
    public void ShowNoti(string noti, bool success)
    {
        SoundControl.instance.PlayShot(SoundControl.instance.click);
        if (Application.platform != RuntimePlatform.Android && noti.Contains("outfit"))
        {
            noti = noti.Replace("outfit", "character");
        }
        this.gameObject.SetActive(true);
        main.DOKill();
        main.localPosition = Vector3.zero;
        //main.DOAnchorPosY(100, 1.2f);
        txtNoti.text = noti;
        txtNoti.color = success ? successColor : failColor;
        if (tweenDelay != null)
        {
            tweenDelay.Kill();
        }
        tweenDelay =  DOVirtual.DelayedCall(1.5f, () =>
        {
            this.gameObject.SetActive(false);
        });
    }

    public void ShowAdsNotAvailable()
    {
        ShowNoti("Load failed! Please try again", false);
    }

    private void OnDestroy()
    {
        if (tweenDelay != null)
        {
            tweenDelay.Kill();
        }
    }
}
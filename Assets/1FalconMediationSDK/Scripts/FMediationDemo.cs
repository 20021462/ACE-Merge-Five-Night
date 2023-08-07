using System;
using System.Collections;
using System.Collections.Generic;
using FMediation;
using UnityEngine;

public class FMediationDemo : MonoBehaviour
{
    private void Awake()
    {
        Init();
    }

    [Header("Debug")]
    public UnityEngine.UI.Text txtDebug;
    public void Init()
    {
        FMediation_Adapter.bannerBackgroundColor = new Color(0,0,0,0);
        FMediation_AdaptSwitcher.Setup(isShowInterBackupForVideoNotAvailable: true);
    }

    public void ShowBanner()
    {
        txtDebug.text = "Show banner";
        FMediation_AdaptSwitcher.ShowBanner();
    }

    public void HideBanner()
    {
        txtDebug.text = "Hide banner";
        var bannerReady = FMediation_AdaptSwitcher.IsBannerReady;
        FMediation_AdaptSwitcher.HideBanner();
    }

    public void ShowInterstitial()
    {
        txtDebug.text = "Show interstitial";
        var interReady = FMediation_AdaptSwitcher.IsInterstitialReady;
        FMediation_AdaptSwitcher.ShowInterstitial("inter_complete_level", 0);
    }

    public void ShowRewardedVideo()
    {
        txtDebug.text = "Show rewardedVideo";
        var rewardedReady = FMediation_AdaptSwitcher.IsRewardedVideoReady;
        FMediation_AdaptSwitcher.ShowRewardedVideo(()=> txtDebug.text = "Received rewarded", ()=> txtDebug.text = "Show rewardedVideo fail!", "video_claim_x2_complete_level", 0);
    }

    // Only Ironsource
    public void LoadBanner()
    {
        FMediation_AdaptSwitcher.LoadBanner();
    }
}

using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AdsAdapter : MonoBehaviour
{
    public static AdsAdapter instance;
    private const bool testAd = false;

    public int adscount
    {
        get => PlayerPrefs.GetInt("ads_count");
        set => PlayerPrefs.SetInt("ads_count", value);
    }

    private void Awake()
    {
        if (instance != null)
        {
            DestroyImmediate(gameObject);
            return;
        }
        else
        {
            instance = this;
            DontDestroyOnLoad(transform.parent.gameObject);
#if !UNITY_EDITOR
        if (!Debug.isDebugBuild)
        {
            Debug.unityLogger.logEnabled = false;
        }
#endif
            Init();
        }
    }


    public void Init()
    {
        //if (!testAd)
    }

    public void ShowBanner()
    {
    }

    public void HideBanner()
    {
    }

    public void ShowInterstitial()
    {
    }

    public void ShowRewardedVideo(Action onComplete, Action onFail, string where)
    {
        onComplete?.Invoke();
    }

}
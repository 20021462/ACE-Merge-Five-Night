using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace FMediation
{
    public class FMediation_AdaptSwitcher
    {
        public static void Setup(bool isShowInterBackupForVideoNotAvailable)
        {
#if EXISTED_IRON_SOURCE
            FMediation_AdaptSwitcher.SetupIronsource(isShowInterBackupForVideoNotAvailable);
#elif EXISTED_MAX
            FMediation_AdaptSwitcher.SetupMAX(isShowInterBackupForVideoNotAvailable);
#endif
        }
        
#if EXISTED_IRON_SOURCE
        public static string ironsource_key_android;
        public static string ironsource_key_ios;

        public static void SetupIronsource(bool isShowInterBackupForVideoNotAvailable)
        {
            var config = JsonUtility.FromJson<FMediation_Config.config>(Resources.Load<TextAsset>("falcon_mediation_config").text);
            enableLogData4Game = config.enableLogData4Game;
            ironsource_key_android = config.ironsource.ironsource_key_android;
            ironsource_key_ios = config.ironsource.ironsource_key_ios;
            //Debug.Log($"[Ironsource setup] androidKey {ironsource_key_android} " +
                      $"iosKey {ironsource_key_ios}");
            
            var maxGo = new GameObject("[FMediation] Ironsource", typeof(FMediation_AdapterIronsource));
            GameObject.DontDestroyOnLoad(maxGo);
            adapter = maxGo.GetComponent<FMediation_AdapterIronsource>().Setup(ironsource_key_android, ironsource_key_ios);
            adapter.Init(isShowInterBackupForVideoNotAvailable);
        }

#elif EXISTED_MAX
        public static void SetupMAX(bool isShowInterBackupForVideoNotAvailable)
        {
            var maxGo = new GameObject("[FMediation] MAX", typeof(FMediation_AdapterMAX));
            GameObject.DontDestroyOnLoad(maxGo);
            adapter = maxGo.GetComponent<FMediation_AdapterMAX>()
                .Setup(maxSdkKey: "M4GLwqezVT2WDo75OWFGOV873pVg6-3S3Kpz8Rxe_-9CnHI9oXPB2TI5LpnRnqvr8hpH8kw7i4KTMcc891KCad", 
                    interstitialAdUnitId: "d3725e24a386de56", 
                    rewardedAdUnitId: "cd2b63011361c28f", 
                    rewardedInterstitialAdUnitId:"", 
                    bannerAdUnitId: "492959767b24d22e", 
                    mRecAdUnitId:"");
            adapter.Init(isShowInterBackupForVideoNotAvailable);
        }

#endif
        private static FMediation_Adapter adapter;

        public static bool IsBannerReady => adapter.bannerReady;

        public static void LoadBanner()
        {
            adapter.LoadBanner();
        }
        public static void ShowBanner()
        {
            adapter.ShowBanner();
        }

        public static void HideBanner()
        {
            adapter.HideBanner();
        }

        public static bool IsInterstitialReady => adapter.interstitialReady;
        public static void ShowInterstitial(string where, int maxLevel)
        {
            adapter.ShowInterstitial(where, maxLevel);
        }

        public static void LoadInterstitial()
        {
            adapter.LoadInterstitial();
        }

        public static bool IsRewardedVideoReady => adapter.rewardedVideoReady;

        // #if UNITY_EDITOR
        // private static bool testVideoAvailable = false;
        // #endif
        public static void ShowRewardedVideo(Action onComplete, Action onFail, string where, int maxLevel)
        {
            adapter.onRewardedVideoSuccess = onComplete;
            adapter.onRewardedVideoFail = onFail;
            if (adapter.rewardedVideoReady 
            // #if UNITY_EDITOR
            // && testVideoAvailable
            // #endif
            )
            {
                adapter.isApplyInterBackupForVideo = false;
                adapter.ShowRewardedVideo(where, maxLevel);
            }
            else if (adapter.isShowInterBackupForVideoNotAvailable)
            {
                //Debug.Log("Show Interstitial backup for rewarded video not available");
                if (adapter.interstitialReady)
                {
                    adapter.isApplyInterBackupForVideo = true;
                    adapter.ShowInterstitial(where, maxLevel);
                }
                else
                {
                    adapter.isApplyInterBackupForVideo = false;
                    adapter.onRewardedVideoFail?.Invoke();
                }
            }
        }

        /// <summary>
        /// Only MAX mediation
        /// </summary>
        public static void LoadRewardedVideo()
        {
            adapter.LoadRewardedVideo();
        }
    }
}
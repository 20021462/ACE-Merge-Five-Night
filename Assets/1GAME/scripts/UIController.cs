using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
// using Firebase.Analytics;
#if UNITY_EDITOR
using UnityEditor;
#endif
using UnityEngine;
using UnityEngine.UI;
using System.Globalization;
using System.Net;
using UnityEngine.SceneManagement;

[Serializable]
public class team_position
{
    public animal_type type;
    public evolution evolution;
    public int index_pos;
}

[Serializable]
public class current_team
{
    public List<team_position> positions;

    public current_team(List<team_position> init)
    {
        positions = init;
    }
}

[Serializable]
public class current_trap
{
    public List<int> levels;
}

public class UIController : MonoBehaviour
{
    public static UIController instace;

    public static void LogAFAndFB(string eventName, string key, string value)
    {
    }


    public int open_game_count
    {
        get { return PlayerPrefs.GetInt("first_open", 0); }
        set
        {
#if UNITY_ANDROID
            //FirebaseAnalytics.LogEvent("open_game_count", "count", value);
#endif
            PlayerPrefs.SetInt("first_open", value);
        }
    }

    public bool rate_use
    {
        get { return PlayerPrefs.GetInt("rate_use", 0) == 0 ? false : true; }
        set { PlayerPrefs.SetInt("rate_use", value ? 1 : 0); }
    }

    public int level_unlock
    {
        get { return PlayerPrefs.GetInt("level_unlock", 0); }
        set
        {
#if UNITY_ANDROID
            LogAFAndFB("level_passed", "level", (value + 1).ToString());
#endif
            PlayerPrefs.SetInt("level_unlock", value);
        }
    }

    public int human_spawn_count
    {
        get { return PlayerPrefs.GetInt("human_spawn_count", 0); }
        set
        {
#if UNITY_ANDROID
            //FirebaseAnalytics.LogEvent("human_spawn_count", "count", value);
#endif
            PlayerPrefs.SetInt("human_spawn_count", value);
        }
    }

    public int animal_spawn_count
    {
        get { return PlayerPrefs.GetInt("animal_spawn_count", 0); }
        set
        {
#if UNITY_ANDROID
            //FirebaseAnalytics.LogEvent("animal_spawn_count", "count", value);
#endif
            PlayerPrefs.SetInt("animal_spawn_count", value);
        }
    }

    public string current_team
    {
        get { return PlayerPrefs.GetString("current_team", ""); }
        set { PlayerPrefs.SetString("current_team", value); }
    }

    public string current_trap
    {
        get { return PlayerPrefs.GetString("current_trap", ""); }
        set { PlayerPrefs.SetString("current_trap", value); }
    }

    public int sound
    {
        get { return PlayerPrefs.GetInt("sound", 1); }
        set
        {
#if UNITY_ANDROID
            //FirebaseAnalytics.LogEvent("sound", "enable", value);
#endif
            PlayerPrefs.SetInt("sound", value);
        }
    }

    public int music
    {
        get { return PlayerPrefs.GetInt("music", 1); }
        set
        {
#if UNITY_ANDROID
            //FirebaseAnalytics.LogEvent("music", "enable", value);
#endif
            PlayerPrefs.SetInt("music", value);
        }
    }

    public int vibrate => 0;
    // {
    //     get { return PlayerPrefs.GetInt("vibrate", 1); }
    //     set { PlayerPrefs.SetInt("vibrate", value); }
    // }

    public bool convert_to_long_coin
    {
        get => PlayerPrefs.GetInt("convert_to_long_coin") == 1;
        set => PlayerPrefs.SetInt("convert_to_long_coin", 1);
    }
    public long long_coin
    {
        get
        {
            var s = PlayerPrefs.GetString("long_coin");
            if (string.IsNullOrEmpty(s))
            {
                return 0;
            }
            else
            {
                long coin = 0;
                long.TryParse(s, out coin);
                if (coin < 0)
                {
                    coin = 0;
                }
                return coin;
            }
        }
        set
        {
            PlayerPrefs.SetString("long_coin", value.ToString());
        }
    }


    public int login_day
    {
        get { return PlayerPrefs.GetInt("login_day", -1); }
        set { PlayerPrefs.SetInt("login_day", value); }
    }

    public int day_claimed
    {
        get { return PlayerPrefs.GetInt("day_claimed", -1); }
        set { PlayerPrefs.SetInt("day_claimed", value); }
    }

    public int day_count_from_install
    {
        get { return PlayerPrefs.GetInt("day_count_from_install", -1); }
        set
        {
#if UNITY_ANDROID
            //FirebaseAnalytics.LogEvent("day_count_from_install", "count", value);
#endif
            PlayerPrefs.SetInt("day_count_from_install", value);
        }
    }

    public int animal_level
    {
        get { return PlayerPrefs.GetInt("animal_level", 1); }
        set
        {
#if UNITY_ANDROID
            //FirebaseAnalytics.LogEvent("animal_level", "level", value);
#endif
            PlayerPrefs.SetInt("animal_level", value);
        }
    }

    public int human_level
    {
        get { return PlayerPrefs.GetInt("human_level", 1); }
        set
        {
#if UNITY_ANDROID
            //FirebaseAnalytics.LogEvent("human_level", "level", value);
#endif
            PlayerPrefs.SetInt("human_level", value);
        }
    }

    public WinPopup WinPopup;
    public SettingPopup SettingPopup;
    public PanelMoney PanelMoney;
    public NotiPopup NotiPopup;
    public DailyReward DailyRewardPopup;
    public DictionaryPopup DictionaryPopup;
    public NewLevelPopup NewLevelPopup;
    public GiftPopup GiftPopup;
    public NewMapPopup NewMapPopup;
    public RatingPopup RatingPopup;
    public DeletePopup DeletePopup;
    public ShopPopup ShopPopup;
    public Animator btn_dictionary;
    public Text txt_add_coin;
    public GameObject btn_add_coin, btn_remove_ads;
    public GameObject deleting;
    public Text txt_xcoin;
    public static bool show_rate_in_day;

    private void Awake()
    {
        // #if UNITY_EDITOR
        // Debug.Log("add coin");
        //long_coin = 999_000_000_000;
        // #endif
        var canvasScaler = GetComponent<CanvasScaler>();
        var ratio = (float) Screen.height / (float) Screen.width;
        //Debug.Log("ratio: " + ratio);
        if (ratio >= 1.7f)
        {
            canvasScaler.matchWidthOrHeight = 0;
        }
        else canvasScaler.matchWidthOrHeight = 1;

        DOVirtual.DelayedCall(2, () =>
        {
            AdsAdapter.instance.ShowBanner();
        });
        DOVirtual.DelayedCall(4, () => AdsAdapter.instance.ShowBanner());
        DOVirtual.DelayedCall(8, () => AdsAdapter.instance.ShowBanner());

        if (instace != null)
        {
            Destroy(gameObject);
            return;
        }
        else
        {
            instace = this;

            if (Application.internetReachability != NetworkReachability.NotReachable)
            {
                var datetime = GetNetTime();
                if (Debug.isDebugBuild)
                {
                    datetime = DateTime.Now;
                }

                DOVirtual.DelayedCall(1, () =>
                {
                    var day = datetime.Day;
                    var cached_day = login_day;
                    //Debug.LogError($"curday: {day} cachedday: {cached_day} daycount: {day_count_from_install} daycout_claim: {day_claimed}");
                    var not_claim_today = day == cached_day && day_claimed < day_count_from_install;
                    if (day != cached_day || not_claim_today)
                    {
                        login_day = day;
                        if (!not_claim_today)
                        {
                            day_count_from_install++;
                        }

                        //Debug.LogError($"countday: {day_count_from_install}");
                        if (day_count_from_install > 0)
                        {
                            DailyRewardPopup.Show(day_count_from_install);
                        }
                    }
                });
            }
        }

        btn_add_coin.SetActive(level_unlock >= 3);
        DOVirtual.DelayedCall(1, UpdateAddCoinText);
    }

    long coin_add_video;

    public void UpdateAddCoinText()
    {
        long coin = LevelControl.instance.price_animal;
        var level = level_unlock + 1;
        if (level >= 25)
        {
            if (LevelControl.instance.price_animal > LevelControl.instance.price_human)
            {
                coin = (long)(LevelControl.instance.price_animal * LevelControl.instance.bonus_price7);
            }
            else
            {
                coin = (long)(LevelControl.instance.price_human * LevelControl.instance.bonus_price7);
            }
        }
        else if (level >= 20)
        {
            if (LevelControl.instance.price_animal > LevelControl.instance.price_human)
            {
                coin = (long)(LevelControl.instance.price_animal * LevelControl.instance.bonus_price4);
            }
            else
            {
                coin = (long)(LevelControl.instance.price_human * LevelControl.instance.bonus_price4);
            }
        }
        else if (LevelControl.instance.price_human > coin)
        {
            coin = LevelControl.instance.price_human;
        }

        coin_add_video = coin * 2;
        
        txt_add_coin.text = "+" + coin_add_video.GetNumberAroundString();
    }


    [ContextMenu("Test Load Scene")]
    public void TestLoadScene()
    {
        SceneManager.LoadScene(0);
    }

    void Start()
    {
        SoundControl.instance.ChangeSoundVolume();
        SoundControl.instance.ChangeMusicVolume();
        // DOVirtual.DelayedCall(0.1f, () =>
        // {
        //     //btn_remove_ads.SetActive(!IAPManager.instance.bought_noads);
        //     // txt_xcoin.gameObject.SetActive(1 > 1);
        //     // txt_xcoin.text = "x" + 1;
        // });
    }

    public void ReloadXCoin()
    {
        // txt_xcoin.gameObject.SetActive(IAPManager.instance.bought_xcoin > 1);
        // txt_xcoin.text = "x" + IAPManager.instance.bought_xcoin;
    }

    public static DateTime GetNetTime()
    {
        return DateTime.Now;
        try
        {
            var myHttpWebRequest = (HttpWebRequest) WebRequest.Create("http://www.microsoft.com");
            var response = myHttpWebRequest.GetResponse();
            string todaysDates = response.Headers["date"];
            return DateTime.ParseExact(todaysDates,
                "ddd, dd MMM yyyy HH:mm:ss 'GMT'",
                CultureInfo.InvariantCulture.DateTimeFormat,
                DateTimeStyles.AssumeUniversal);
        }
        catch (Exception e)
        {
            //Debug.LogError(e.StackTrace);
            return DateTime.Now;
        }
    }

    public void ShowSetting()
    {
        SettingPopup.Show(null);
    }

    public void ShowDictionary()
    {
        DictionaryPopup.Show(null);
    }

    public void ShowShop()
    {
        ShopPopup.Show(null);
    }
    
    public void ShowAddCoin()
    {
        AdsAdapter.instance.ShowRewardedVideo(() =>
        {
            UIController.instace.long_coin += coin_add_video;
            UIController.instace.PanelMoney.CountCoin(UIController.instace.long_coin);
            UIController.instace.PanelMoney.Effect(txt_add_coin.transform.position);
            LevelControl.instance.UpdateButtonBuy();
        }, () => UIController.instace.NotiPopup.ShowNoti("Try again!", false), "bonus_new_level");
    }

    private IEnumerator ieHideDeleteAction;

    public void ShowDeletePopup()
    {
        deleting.SetActive(!deleting.activeInHierarchy);
        if (deleting.activeInHierarchy)
        {
            UIController.instace.NotiPopup.ShowNoti("Select an ally to remove", true);
            if (ieHideDeleteAction != null)
            {
                StopCoroutine(ieHideDeleteAction);
            }

            StartCoroutine(ieHideDeleteAction = IEHideDeleteAction());
        }
    }

    public bool ValidateBtnDelete()
    {
        // deleting.SetActive(false);
        // deleting.transform.parent.gameObject.SetActive(false);
        // return true;
        if (LevelControl.instance.allies.Count <= 1)
        {
            deleting.SetActive(false);
            deleting.transform.parent.gameObject.SetActive(false);
            return true;
        }
        else
        {
            deleting.SetActive(false);
            deleting.transform.parent.gameObject.SetActive(true);
            return false;
        }
    }

    IEnumerator IEHideDeleteAction()
    {
        yield return new WaitForSeconds(5);
        HideDeleteAction();
    }

    public void HideDeleteAction()
    {
        deleting.SetActive(false);
    }

    public void HideBtnDelete()
    {
        deleting.SetActive(false);
        deleting.transform.parent.gameObject.SetActive(false);
    }
}

#if UNITY_EDITOR

public static class Pref
{
    [MenuItem("player_pref/clear_all")]
    public static void clear_all()
    {
        PlayerPrefs.DeleteAll();
    }

    [MenuItem("player_pref/add_200_000_coin")]
    public static void add_200_000_coin()
    {
        PlayerPrefs.SetInt("coin", 200_000);
    }

    [MenuItem("player_pref/add_20_000_coin")]
    public static void add_2_000_000_coin()
    {
        PlayerPrefs.SetInt("coin", 2_000_000);
    }

    [MenuItem("player_pref/add_200_000_000_coin")]
    public static void add_1_000_000_000_coin()
    {
        var coin = PlayerPrefs.GetInt("coin") + 1_000_000_000;
        bool isMax = coin >= int.MaxValue;
        bool isNegative = coin < 0;
        PlayerPrefs.SetInt("coin", coin);
    }
    [MenuItem("player_pref/add_long_1_000_000_000_coin")]
    public static void add_long_1_000_000_000_coin()
    {
        var s = PlayerPrefs.GetString("long_coin");
        long curCoin = 0;
        if (string.IsNullOrEmpty(s))
        {
            curCoin = 0;
        }
        else
        {
            long.TryParse(s, out curCoin);
        }

        curCoin += 1_000_000_000;
        
        PlayerPrefs.SetString("long_coin", curCoin.ToString());
    }

    [MenuItem("player_pref/unlock_level39")]
    public static void unlock_lv39()
    {
        PlayerPrefs.SetInt("level_unlock", 39);
    }

    [MenuItem("player_pref/unlock_level99")]
    public static void unlock_lv99()
    {
        PlayerPrefs.SetInt("level_unlock", 99);
    }
}
#endif
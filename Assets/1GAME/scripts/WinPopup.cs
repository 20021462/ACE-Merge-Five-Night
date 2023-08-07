using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using DG.Tweening;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class Popup : MonoBehaviour
{
    public Transform main;

    public virtual void Show(object data)
    {
        main.localScale = Vector3.one * 0.2f;
        main.DOScale(1, 0.2f);
        gameObject.SetActive(true);
        SoundControl.instance.PlayShot(SoundControl.instance.click);
    }

    public virtual void Hide()
    {
        gameObject.SetActive(false);
        SoundControl.instance.PlayShot(SoundControl.instance.click);
    }
}

public class WinPopup : Popup
{
    public int start_next_y, end_next_y;
    public List<GameObject> win_titles;
    public BonusRW bonusrw;
    public Text[] txt_coin_levels;
    public Text txt_continue;
    public GameObject bonus, i_next;
    public RectTransform btn_bonus_coin, btn_next, btn_next_lose_lv3;
    public GameObject win_obj, lose_obj;
    public Animator endlevel_fade;
    public GameObject bonus_x10_coin;
    public Sprite fade_win, fade_lose;
    public static long coin;
    public static List<bool> win_chains = new List<bool>();
    public static bool isWin = true;
    float x10Coin = 1;

    private void OnEnable()
    {
        SoundControl.instance.PlayShot(SoundControl.instance.click);
    }

    public override void Show(object data)
    {
        main.localScale = Vector3.zero;
        DOVirtual.DelayedCall(0.7f, () => main.DOScale(1, 0.3f));
        gameObject.SetActive(true);
        SoundControl.instance.PlayShot(SoundControl.instance.click);

        LevelControl.instance.coin = LevelControl.instance.coin.GetNumberAround();

        isWin = (bool) data;
        endlevel_fade.Play("endlevel_in");
        if (isWin)
        {
            endlevel_fade.GetComponent<Image>().sprite = fade_win;
        }
        else{
            endlevel_fade.GetComponent<Image>().sprite = fade_lose;
        }
        win_chains.Add(isWin);
        int lose_count = 0;
        for(int i = win_chains.Count - 1; i >=0; i--)
        {
            if (win_chains[i])
                break;
            lose_count++;
        }
        int level = UIController.instace.level_unlock + 1;
        if (isWin)
        {
            if (level >= 25)
            {
                x10Coin = 6;
                bonus_x10_coin.SetActive(true);
            }
            else if (level >= 22)
            {
                x10Coin = 10;
                bonus_x10_coin.SetActive(true);
            }
            else if (level >= 21)
            {
                x10Coin = 20;
                bonus_x10_coin.SetActive(true);
            }
            else if (level >= 20)
            {
                x10Coin = 22;
                bonus_x10_coin.SetActive(true);
            }
            else if (level >= 19)
            {
                x10Coin = 22;
                bonus_x10_coin.SetActive(true);
            }
            else if (level >= 17)
            {
                x10Coin = 20;
                bonus_x10_coin.SetActive(true);
            }
            else if (level >= 15)
            {
                x10Coin = 15;
                bonus_x10_coin.SetActive(true);
            }
            else if (level >= 10)
            {
                x10Coin = 10;
                bonus_x10_coin.SetActive(true);
            }
            else if (level >= 7)
            {
                x10Coin = 5;
                bonus_x10_coin.SetActive(true);
            }
            else if (level >= 5)
            {
                x10Coin = 2;
                bonus_x10_coin.SetActive(true);
            }
            else if (level >= 2)
            {
                x10Coin = 1.5f;
                bonus_x10_coin.SetActive(true);
            }
            UIController.LogAFAndFB("level_completed", "level", level.ToString());
        }
        else
        {
            if (level >= 40)
            {
                x10Coin = 6;
            }
            else if (level >= 35)
            {
                x10Coin = 6;
            }
            else if (level >= 30)
            {
                x10Coin = 6;
            }
            else if (level >= 23)
            {
                x10Coin = 6;
            }
            else if (level >= 22)
            {
                x10Coin = 10;
            }
            else if (level >= 21)
            {
                x10Coin = 18;
            }
            else if (level >= 20)
            {
                x10Coin = 15;
            }
            else if (level >= 15)
            {
                x10Coin = 15;
            }
            else if (level >= 12)
            {
                x10Coin = 13;
            }
            else if (level >= 10)
            {
                x10Coin = 7;
            }
            else if (level >= 7)
            {
                x10Coin = 4;
            }
            else if (level >= 5)
            {
                x10Coin = 2f;
            }

            //-----
            if (lose_count >= 10)
            {
                x10Coin += 30;
            }
            else if (lose_count >= 9)
            {
                x10Coin += 25;
            }
            else if (lose_count >= 8)
            {
                x10Coin += 20;
            }
            else if (lose_count >= 7)
            {
                x10Coin += 15;
            }
            else if (lose_count >= 6)
            {
                x10Coin += 10;
            }
            else if (lose_count >= 5)
            {
                x10Coin += 7;
            }
            else if (lose_count >= 4)
            {
                x10Coin += 4;
            }
            else if (lose_count >= 3)
            {
                x10Coin += 3;  
            }
            else if (lose_count >= 2)
            {
                x10Coin += 1.5f;
            }
            else if (lose_count >= 1)
            {
                x10Coin += 1;
            }
            
            bonus_x10_coin.SetActive(false);
            UIController.LogAFAndFB("level_failed", "level", level.ToString());
            UIController.LogAFAndFB("level_failed_count", level.ToString(), lose_count.ToString());
        }

        coin = (long)(LevelControl.instance.coin * x10Coin);
        foreach (var txt in txt_coin_levels)
        {
            txt.text = "+" + LevelControl.instance.coin.GetNumberAroundString();
        }

        win_obj.SetActive(isWin);
        lose_obj.SetActive(!isWin);
        bonus.SetActive(UIController.instace.level_unlock + 1 >= 3 || isWin);
        if (!isWin && UIController.instace.level_unlock + 1 < 3)
        {
            btn_next.gameObject.SetActive(false);
            btn_next_lose_lv3.gameObject.SetActive(true);
        }
        else
        {
            StartCoroutine(ieShowBtnNext());
        }

        i_next.SetActive(false);
        btn_next.anchoredPosition = new Vector2(0, start_next_y);
        if (Application.platform != RuntimePlatform.IPhonePlayer)
        {
            if (isWin && !UIController.show_rate_in_day && UIController.instace.level_unlock + 1 >= 4 && 
                !UIController.instace.rate_use)
            {
                UIController.show_rate_in_day = true;
                UIController.instace.RatingPopup.Show(null);
            }
        }
    }

    IEnumerator ieShowBtnNext()
    {
        btn_next.gameObject.SetActive(false);
        yield return new WaitForSeconds(2);
        btn_next.transform.localScale = Vector3.one * 0.8f;
        btn_next.gameObject.SetActive(true);
        btn_next.transform.DOScale(1, 1);
    }

    bool got_bonus;
    public void GetBonus()
    {
        long coin = bonusrw.reward;

        AdsAdapter.instance.ShowRewardedVideo(() =>
        {
            got_bonus = true;
            StopAllCoroutines();
            bonus.SetActive(false);
            i_next.SetActive(true);
            btn_next.gameObject.SetActive(true);
            btn_next.anchoredPosition = new Vector2(0, end_next_y);
            btn_next.transform.localScale = Vector3.one;
            txt_continue.text = "Continue";
            UIController.instace.long_coin += coin;

            UIController.instace.PanelMoney.CountCoin(UIController.instace.long_coin);
            UIController.instace.PanelMoney.Effect(btn_bonus_coin.transform.position);
            UIController.instace.NotiPopup.ShowNoti($"+{coin.GetNumberAroundString()} coin", true);
            SoundControl.instance.PlayShot(SoundControl.instance.collect_coin);
        }, UIController.instace.NotiPopup.ShowAdsNotAvailable, "bonus_coin_win");
    }

    private bool getcoin;

    public void Next()
    {
        if (getcoin)
        {
            return;
        }

        getcoin = true;
        // UIController.instace.coin += coin;
        UIController.instace.NotiPopup.ShowNoti($"+{LevelControl.instance.coin.GetNumberAroundString()} coin", true);
        // UIController.instace.PanelMoney.CountCoin(UIController.instace.coin);
        UIController.instace.PanelMoney.Effect(btn_next.position);
        SoundControl.instance.PlayShot(SoundControl.instance.click);
        
        if(!got_bonus)
        {
            AdsAdapter.instance.ShowInterstitial();
        }
        DOVirtual.DelayedCall(0.6f, () =>
        {
            if (isWin)
            {
                UIController.instace.level_unlock++;
                if (UIController.instace.level_unlock >= LevelControl.levelCount)
                {
                    UIController.instace.level_unlock = LevelControl.levelCount - 1;
                }

                //Debug.LogError("load level: " + UIController.instace.level_unlock);
            }

            SceneManager.LoadScene(0);
        });
    }
}
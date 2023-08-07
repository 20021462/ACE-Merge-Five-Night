using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GiftPopup : Popup
{
    public Text txt_coin;
    long coin = 1000;
    public ParticleSystem par;

    public void ClickReward()
    {
        AdsAdapter.instance.ShowRewardedVideo(() =>
        {
            UIController.instace.long_coin += (int)coin;
            UIController.instace.PanelMoney.CountCoin(UIController.instace.long_coin);
            UIController.instace.PanelMoney.Effect(transform.position);
            par.transform.SetParent(null);
            par.Play();
            LevelControl.instance.UpdatePrice();
            Hide();
        }, () => UIController.instace.NotiPopup.ShowNoti("Try again", false), "buy_coin_gift");
    }

    public override void Show(object data)
    {
        base.Show(data);
        if (data == null)
        {
            int level = UIController.instace.level_unlock;
            float factor = 2;
            if (level >= 30)
            {
                factor = 15;
            }
            else if (level >= 23)
            {
                factor = 15;
            }
            else if (level >= 22)
            {
                factor = 15;
            }
            else if (level >= 21)
            {
                factor = 25;
            }
            else if (level >= 20)
            {
                factor = 18;
            }
            else if (level >= 15)
            {
                factor = 12;
            }
            else if (level >= 10)
            {
                factor = 6;
            }
            else if (level >= 5)
            {
                factor = 3;
            }

            int count_lose = 0;
            for (int i = WinPopup.win_chains.Count - 1; i >= 0; i--)
            {
                if (WinPopup.win_chains[i])
                {
                    break;
                }

                count_lose++;
            }

            //Debug.LogError(count_lose);
            if (count_lose >= 10)
            {
                factor += 50;
            }
            else if (count_lose >= 9)
            {
                factor += 40;
            }
            else if (count_lose >= 8)
            {
                factor += 30;
            }
            else if (count_lose >= 7)
            {
                factor += 24;
            }
            else if (count_lose >= 6)
            {
                factor += 18;
            }
            else if (count_lose >= 5)
            {
                factor += 12;
            }
            else if (count_lose >= 4)
            {
                factor += 8;
            }
            else if (count_lose >= 3)
            {
                factor += 5;
            }
            else if (count_lose >= 2)
            {
                factor += 3;
            }

            long priceByLevel = level * level * 64 *
                               (long) Mathf.Sqrt(UIController.instace.human_spawn_count *
                                                UIController.instace.animal_spawn_count);
            coin = (long) (
                (long) Mathf.Pow(2, UIController.instace.human_level) * 4
                                                                      * (long) Mathf.Pow(2,
                                                                          UIController.instace.animal_level) * 4
                                                                      * factor
                + priceByLevel);
        }
        else
        {
            coin = (long) data;
        }

        coin = coin.GetNumberAround();
        txt_coin.text = coin.GetNumberAroundString();
        txt_coin.transform.GetChild(0).GetComponent<Text>().text = coin.GetNumberAroundString();
    }

    public override void Hide()
    {
        base.Hide();
        par.transform.SetParent(transform);
    }
}
using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;
using UnityEngine.UI;

public class DailyReward : Popup
{
    public List<ButtonEffectLogic> btns;
    public List<Text> txt_coin;
    public ButtonEffectLogic btn_claim, btn_claimx2;
    public RectTransform highlight;
    private bool claimed;
    
    private List<int> rewards = new List<int>()
    {
        2000,
        3000,
        7000,
        5000,
        6000,
        7000,
        12000,
    };

    public override void Show(object data)
    {
        base.Show(data);
        var day_count_from_install = (int) data;
        var index_day = (day_count_from_install - 1) % 7;
        highlight.SetParent(btns[index_day].transform);
        highlight.SetSiblingIndex(0);
        highlight.anchoredPosition = Vector2.zero;
        for (int i = 0; i < btns.Count; i++)
        {
            var index = i;
            var texts = txt_coin[i].GetComponentsInChildren<Text>();
            foreach (var txt in texts)
            {
                txt.text = rewards[i].ToString();
            }
            if (index < index_day)
            {
                btns[index].interactable = false;
            }
            btns[index].onClick.AddListener(() =>
            {
                if (index > index_day)
                {
                    UIController.instace.NotiPopup.ShowNoti("The next day's reward", false);
                }
            });
        }
        
        btn_claim.onClick.AddListener(() =>
        {
            if (!claimed)
            {
                claimed = true;
                UIController.instace.day_claimed = day_count_from_install;
                UIController.instace.long_coin += (int)rewards[index_day];

                UIController.instace.PanelMoney.CountCoin(UIController.instace.long_coin);
                UIController.instace.PanelMoney.Effect(transform.position);
                DOVirtual.DelayedCall(0.2f, Hide);
            }
        });
        btn_claimx2.onClick.AddListener(() =>
        {
            if (!claimed)
            {
                AdsAdapter.instance.ShowRewardedVideo(() =>
                {
                    claimed = true;
                    UIController.instace.day_claimed = day_count_from_install;
                    
                    UIController.instace.long_coin += (int)rewards[index_day];
                    UIController.instace.PanelMoney.CountCoin(UIController.instace.long_coin);
                    UIController.instace.PanelMoney.Effect(transform.position);
                    DOVirtual.DelayedCall(0.2f, Hide);
                }, () => UIController.instace.NotiPopup.ShowNoti("Try again", false), "claimx2_daily_reward");
            }
        });
    }
}

using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;
using UnityEngine.UI;

public class NewLevelPopup : Popup
{
    public AnimalLevelData AnimalLevelData;
    public Text txt_damage, txt_hp;
    public List<GameObject> animals;
    public List<GameObject> humans;
    public Text txt_add_coin;

    public override void Show(object data)
    {
        base.Show(data);
        foreach (var animal in animals)
        {
            animal.SetActive(false);
        }

        foreach (var human in humans)
        {
            human.SetActive(false);
        }

        var item = (List<int>) data;
        var isAnimal = item[0] == 0;
        var evolution = item[1];
        if (isAnimal)
        {
            animals[evolution].SetActive(true);
        }
        else
        {
            humans[evolution].SetActive(true);
        }

        var dic_item = isAnimal ? AnimalLevelData.animal_levels[evolution] : AnimalLevelData.human_levels[evolution];
        txt_damage.text = dic_item.damage.GetNumberAroundString();
        txt_hp.text = dic_item.hp.GetNumberAroundString();

        DOVirtual.DelayedCall(0.5f, () =>
        {
            var coin = LevelControl.instance.price_animal;
            if (LevelControl.instance.price_human > coin)
            {
                coin = LevelControl.instance.price_human;
            }

            coin *= 20;
            coin = coin.GetNumberAround();
            coin_add_video = coin;
            txt_add_coin.text = coin_add_video.GetNumberFormat();
        });
    }

    private long coin_add_video;
    public override void Hide()
    {
        base.Hide();
        UIController.instace.btn_dictionary.Play("btn_dictionary");
    }
    
    public void ShowAddCoin()
    {
        AdsAdapter.instance.ShowRewardedVideo(() =>
        {
            UIController.instace.long_coin += coin_add_video;
            UIController.instace.PanelMoney.CountCoin(UIController.instace.long_coin);
            UIController.instace.PanelMoney.Effect(txt_add_coin.transform.position);
            LevelControl.instance.UpdateButtonBuy();
        }, ()=> UIController.instace.NotiPopup.ShowNoti("Try again!", false), "bonus_new_level");
    }
}
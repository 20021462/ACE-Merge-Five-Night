using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;

public class Tutorial : MonoBehaviour
{
    private GameObject btn_buy_human, btn_not_huy_human, btn_buy_animal, btn_not_buy_animal;
    public GameObject fade_button;
    public GameObject arrow_merge;
    public GameObject arrow_move_animal;
    public void SetBtns(GameObject btn_buy_human, GameObject btn_not_huy_human, GameObject btn_buy_animal,
        GameObject btn_not_buy_animal)
    {
        this.btn_buy_human = btn_buy_human;
        this.btn_not_huy_human = btn_not_huy_human;
        this.btn_buy_animal = btn_buy_animal;
        this.btn_not_buy_animal = btn_not_buy_animal;
    }

    public void LoadLevel(int level_index)
    {
        arrow_merge.gameObject.SetActive(false);
        int level = level_index + 1;
        //Debug.LogError(level);
        if (level == 1)
        {
            if (UIController.instace.long_coin <= 0)
            {
                btn_buy_human.SetActive(false);
                btn_not_huy_human.SetActive(false);
                btn_buy_animal.SetActive(false);
                btn_not_buy_animal.SetActive(false);
            }
            else if(UIController.instace.human_spawn_count == 0)
            {
                btn_buy_human.SetActive(false);
                btn_not_huy_human.SetActive(false);
                btn_buy_animal.SetActive(false);
                btn_not_buy_animal.SetActive(false);

                UIController.instace.long_coin = 2;
                UIController.instace.PanelMoney.CountCoin(UIController.instace.long_coin);
                UIController.instace.PanelMoney.Effect(transform.position);
                DOVirtual.DelayedCall(0.3f, () =>
                {
                    fade_button.SetActive(true);
                    btn_buy_human.SetActive(true);
                    btn_buy_human.transform.GetChild(btn_buy_human.transform.childCount - 1).gameObject
                        .SetActive(true); // active hand
                });
            }
        }
        else if (level == 2 && UIController.instace.animal_level == 1 && UIController.instace.animal_spawn_count == 1)
        {
            btn_buy_human.SetActive(false);
            btn_not_huy_human.SetActive(false);
            btn_buy_animal.SetActive(false);
            btn_not_buy_animal.SetActive(false);

            DOVirtual.DelayedCall(0.3f, () =>
            {
                fade_button.SetActive(true);
                btn_buy_animal.SetActive(true);
                btn_buy_animal.transform.GetChild(btn_buy_animal.transform.childCount - 1).gameObject
                    .SetActive(true); // active hand
            });
        }
    }

    public void OnClickBuyAnimal()
    {
        fade_button.SetActive(false);
        btn_buy_human.transform.GetChild(btn_buy_human.transform.childCount - 1).gameObject.SetActive(false);
        StartCoroutine(IEShowArrowMerge());
    }

    IEnumerator IEShowArrowMerge()
    {
        in_tutorial = UIController.instace.level_unlock + 1 == 2 && UIController.instace.animal_level == 1 &&
                      LevelControl.instance.allies.Count <= 3;
        yield return new WaitForSeconds(0.5f);
        if (UIController.instace.level_unlock + 1 == 2 && UIController.instace.animal_level == 1 && LevelControl.instance.allies.Count == 3)
        {
            arrow_merge.SetActive(true);
        }
    }

    public void OnClickBuyHuman()
    {
        fade_button.SetActive(false);
        btn_buy_human.transform.GetChild(btn_buy_human.transform.childCount - 1).gameObject.SetActive(false);
        StartCoroutine(IEShowArrowMove());
    }

    private bool in_tutorial;
    IEnumerator IEShowArrowMove()
    {
        in_tutorial = UIController.instace.level_unlock + 1 == 1 && LevelControl.instance.allies.Count <= 2;
        yield return new WaitForSeconds(0.5f);
        if (UIController.instace.level_unlock + 1 == 1 && LevelControl.instance.allies.Count == 2)
        {
            arrow_move_animal.SetActive(true);
        }
    }

    public void OnMerge()
    {
        in_tutorial = false;
        arrow_merge.gameObject.SetActive(false);
    }

    public void OnMoveAlly()
    {
        in_tutorial = false;
        arrow_move_animal.SetActive(false);
    }

    public bool CompleteTutorial()
    {
        return !arrow_merge.activeInHierarchy && !arrow_move_animal.activeInHierarchy && !fade_button.activeInHierarchy && !in_tutorial;
    }
}
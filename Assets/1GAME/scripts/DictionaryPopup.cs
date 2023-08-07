using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DictionaryPopup : Popup
{
    public AnimalLevelData AnimalLevelData;
    public GameObject animal, human;
    public GameObject img_active_animal, img_active_human;
    public List<Text> animal_hps;
    public List<Text> animal_damages;
    public List<GameObject> animal_locks;
    
    public List<Text> human_hps;
    public List<Text> human_damages;
    public List<GameObject> human_locks;
    

    private void OnEnable()
    {
        SetValue(animal_hps, animal_damages, AnimalLevelData.animal_levels);
        SetValue(human_hps, human_damages, AnimalLevelData.human_levels);
        var animal_level = UIController.instace.animal_level;
        for (int i = 0; i < animal_locks.Count; i++)
        {
            animal_locks[i].SetActive(i >= animal_level);
        }
        var human_level = UIController.instace.human_level;
        for (int i = 0; i < human_locks.Count; i++)
        {
            human_locks[i].SetActive(i >= human_level);
        }
    }

    void SetValue(List<Text> txt_hps, List<Text> txt_damages, List<dic_item> item_datas)
    {
        for (int i = 0; i < txt_hps.Count; i++)
        {
            var dic_item = item_datas[i];
            txt_hps[i].text = dic_item.hp.GetNumberAroundString();
            txt_damages[i].text = dic_item.damage.GetNumberAroundString();
        }
    }

    public void ShowAnimal()
    {
        animal.SetActive(true);
        human.SetActive(false);
        img_active_animal.SetActive(true);
        img_active_human.SetActive(false);
    }

    public void ShowHuman()
    {
        animal.SetActive(false);
        human.SetActive(true);
        img_active_animal.SetActive(false);
        img_active_human.SetActive(true);
    }
    public void ShowEnemy()
    {
        animal.SetActive(false);
        human.SetActive(false);
        img_active_animal.SetActive(true);
        img_active_human.SetActive(true);
    }
}

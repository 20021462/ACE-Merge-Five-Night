using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[Serializable]
public class dic_item
{
    public int damage;
    public int hp;
}
[CreateAssetMenu(fileName = "animal_level_data", menuName = "data/animal_level_data")]
public class AnimalLevelData : ScriptableObject
{
    public List<dic_item> human_levels;
    public List<dic_item> animal_levels;


    public (int hp, int damage, float attack_dur, float move_speed) getData(animal_type animalType, evolution evolution)
    {
        var dic_item = animalType == animal_type.human? human_levels[(int) evolution] : animal_levels[(int) evolution];
        int hp = dic_item.hp;
        int damage = dic_item.damage;
        float attack_dur = 2 / 1.5f;
        float move_speed = 2 * 1.5f;
        return (hp, damage, attack_dur, move_speed);
    }
}

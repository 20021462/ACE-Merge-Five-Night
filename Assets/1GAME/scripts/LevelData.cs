using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[Serializable]
public class enemy_data
{
    public animal_type animal_type;
    public evolution evolution;
}
[Serializable]
public class level
{
    public string name;
    public List<enemy_data> enemies;
}
[CreateAssetMenu(fileName = "level_data", menuName = "data/level_data")]
public class LevelData : ScriptableObject
{
    public AnimalLevelData AnimalLevelData;
    public List<level> levels;

    #if UNITY_EDITOR
    private void OnValidate()
    {
        for (int i = 0; i < levels.Count; i++)
        {
            var level = levels[i];
            int hp = 0;
            int damage = 0;
            float attack_dur = 0;
            float move_speed = 0;
            for (int j = 0; j < level.enemies.Count; j++)
            {
                var enemy = level.enemies[j];
                var data2 = AnimalLevelData.getData(enemy.animal_type, enemy.evolution);
                hp += data2.hp;
                damage += data2.damage;
                attack_dur += data2.attack_dur;
                move_speed += data2.move_speed;
            }

            level.name = $"{i + 1} | ecount:{level.enemies.Count} | hp:{hp} | dmg:{damage} | atk_dur:{attack_dur} | move_spd:{move_speed}";
        }
    }
#endif
}

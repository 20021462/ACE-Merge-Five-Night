using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using DG.Tweening;
using UnityEngine;
using UnityEngine.UI;
using Random = UnityEngine.Random;

public enum winstatus
{
    none,
    win,
    lose
}

public class LevelControl : MonoBehaviour
{
    public static LevelControl instance;
    public static int levelCount;
    public GameObject start_ui;
    public Level levelobj;
    public LevelData level_data;
    public AnimalLevelData animal_level_data;
    public List<GameObject> enemy_animal_evolutions;
    public List<GameObject> enemy_human_evolutions;
    public List<GameObject> animal_evolutions;
    public List<GameObject> human_evolutions;
    public List<Trap> traps;
    public Image img_ally_hp;
    public Image img_enemy_hp;

    public GameObject buy_human,
        notbuy_human,
        buy_animal,
        notbuy_animal,
        buy_human2,
        buy_animal2,
        btn_start,
        txt_all_positio_filled;

    public Text txt_human, txt_animal, txt_human2, txt_animal2;
    public Text txt_buy_trap, txt_upgrade_trap;
    public GameObject i_animal4, i_animal7, i_human4, i_human7;

    public GameObject new_map_progress;
    public List<Transform> level_nodes;
    public ParticleSystem win_par;
    private List<int> level_new_enemy = new List<int>() {1, 2, 6, 10, 12, 14, 16, 18, 20, 22, 23, 25, 27, 29, 31};
    public GameObject btn_delete, btn_shop;


    [Header("runtime")] public List<Enemy> enemies = new List<Enemy>();
    public List<Enemy> enemies_dead = new List<Enemy>();

    public List<Ally> allies = new List<Ally>();
    public List<Ally> allies_dead = new List<Ally>();
    private GridSelection grid;
    public long coin;
    private winstatus winstatus;
    private current_team currentTeam;
    private current_trap currentTrap;
    public long price_animal, price_human;
    public Tutorial tutorial;
    public int cur_level;

    private long trap_price, trap_upgrade_pirce;
    private long ally_hp, enemy_hp;
    private long current_ally_hp, current_enemy_hp;

    IEnumerator Start()
    {
        instance = this;
        levelCount = level_data.levels.Count;
        grid = GameObject.FindObjectOfType<GridSelection>();
        yield return null;
        LoadLevel(UIController.instace.level_unlock);
    }

    public void LoadLevel(int level)
    {
        coin = 0;
        int level_number = cur_level = level + 1;
        if (level_number <= 5)
        {
            UIController.instace.HideBtnDelete();
        }
        btn_delete.SetActive(cur_level >= 10);
        //btn_shop.SetActive(cur_level >= 5);
        //Debug.LogError("load level: " + level_number);
        int level_new_map_count = 10;
        var mapIndex = Mathf.Clamp((level_number - 1) / 3, 0, 10);

        new_map_progress.SetActive(level_number >= 3);
        for (int i = 0; i < new_map_progress.transform.childCount; i++)
        {
            if (i > 0)
                new_map_progress.transform.GetChild(i).gameObject.SetActive(level_number <= 32);
        }

        int preEnemy = -1;
        int nextEnemy = -1;
        for (int i = 0; i < level_new_enemy.Count; i++)
        {
            if (level_new_enemy[i] <= level_number)
            {
                preEnemy = i;
            }

            if (level_new_enemy[i] > level_number && nextEnemy == -1)
            {
                nextEnemy = i;
            }
        }

        if (preEnemy == -1) preEnemy = 0;
        if (nextEnemy == -1) nextEnemy = level_new_enemy.Count - 1;
        // pre_enemies[preEnemy].SetActive(true);
        // next_enemies[nextEnemy].SetActive(true);
        // var diffLevel = level_new_enemy[nextEnemy] - level_new_enemy[preEnemy];
        // var pos = rect_pre_enemy.anchoredPosition;
        // if (diffLevel <= 1)
        // {
        //     rect_pre_enemy.anchoredPosition = new Vector2(-50.5f, pos.y);
        //     rect_next_enemy.anchoredPosition = new Vector2(50.5f, pos.y);
        // }
        // else if (diffLevel <= 2)
        // {
        //     rect_pre_enemy.anchoredPosition = new Vector2(-60.2f, pos.y);
        //     rect_next_enemy.anchoredPosition = new Vector2(60.2f, pos.y);
        // }
        // else if (diffLevel <= 3)
        // {
        //     rect_pre_enemy.anchoredPosition = new Vector2(-74.6f, pos.y);
        //     rect_next_enemy.anchoredPosition = new Vector2(74.6f, pos.y);
        // }
        // else
        // {
        //     rect_pre_enemy.anchoredPosition = new Vector2(-89f, pos.y);
        //     rect_next_enemy.anchoredPosition = new Vector2(89f, pos.y);
        // }

        // for (int i = 0; i < level_checks.Count; i++)
        // {
        //     level_checks[i].gameObject.SetActive(i < diffLevel);
        //     if (level_new_enemy[preEnemy] + i < level_number)
        //     {
        //         level_checks[i].GetChild(0).gameObject.SetActive(true);
        //     }
        //     else if (level_new_enemy[preEnemy] + i == level_number)
        //     {
        //         level_checks[i].GetChild(0).gameObject.SetActive(true);
        //         level_checks[i].GetChild(0).GetComponent<Image>().color = new Color32(110, 150, 110, 255);
        //     }
        //     else if (level_new_enemy[preEnemy] + i > level_number)
        //     {
        //         level_checks[i].GetChild(0).gameObject.SetActive(false);
        //     }
        // }
        
        var indexNode = (level_number % 10) + 1;
        for (int i = 0; i < level_nodes.Count; i++)
        {
            level_nodes[i].GetChild(0).gameObject.SetActive(i < indexNode);
        }
        // if (level < level_chain.Count)
        // {
        //     for (int i = 0; i < level_chain.Count; i++)
        //     {
        //         if (i <= level)
        //         {
        //             var image = level_chain[i].GetComponent<Image>();
        //             if (image)
        //             {
        //                 image.color = Color.green;
        //             }
        //
        //             if (level_chain[i].childCount > 0)
        //             {
        //                 var childImage = level_chain[i].GetChild(0).GetComponent<Image>();
        //                 if (childImage)
        //                 {
        //                     childImage.color = Color.white;
        //                 }
        //             }
        //         }
        //     }
        //
        //     cur_level_chain.transform.SetParent(level_chain[level]);
        //     cur_level_chain.SetAsFirstSibling();
        //     cur_level_chain.anchoredPosition = Vector2.zero;
        // }
        // else
        // {
        //     for (int i = 0; i < level_chain.Count; i++)
        //     {
        //         if (i <= level)
        //         {
        //             var image = level_chain[i].GetComponent<Image>();
        //             if (image)
        //             {
        //                 image.color = Color.green;
        //             }
        //
        //             if (level_chain[i].childCount > 0)
        //             {
        //                 var childImage = level_chain[i].GetChild(0).GetComponent<Image>();
        //                 if (childImage)
        //                 {
        //                     childImage.color = Color.white;
        //                 }
        //             }
        //         }
        //     }
        //
        //     cur_level_chain.gameObject.SetActive(false);
        // }

        levelobj.Reload(mapIndex);

        winstatus = winstatus.none;
        
        var current_trap_cached = UIController.instace.current_trap;
        if (string.IsNullOrEmpty(current_trap_cached))
        {
            currentTrap = new current_trap();
            currentTrap.levels = new List<int>();
        }
        else
        {
            currentTrap = JsonUtility.FromJson<current_trap>(current_trap_cached);
            for (int i = 0; i < currentTrap.levels.Count; i++)
            {
                if (i < traps.Count)
                {
                    traps[i].gameObject.SetActive(true);
                    var levelTrap = Mathf.Clamp(currentTrap.levels[i], 1, 6);
                    var damage = animal_level_data.human_levels[levelTrap - 1].damage;
                    traps[i].SetDamage(levelTrap, damage);
                }
            }
        }
        UpdatePrice();

        var current_team_cached = UIController.instace.current_team;
        if (string.IsNullOrEmpty(current_team_cached))
        {
            currentTeam = new current_team(new List<team_position>());
            SpawnAlly(grid.grids[2], evolution.e1, animal_type.animal, true);
            for (int i = 0; i < start_ui.transform.childCount - 2; i++)
            {
                start_ui.transform.GetChild(i).gameObject.SetActive(i == 0);
            }
        }
        else
        {
            currentTeam = JsonUtility.FromJson<current_team>(current_team_cached);
            foreach (var teamPosition in currentTeam.positions)
            {
                SpawnAlly(grid.grids[teamPosition.index_pos], teamPosition.evolution, teamPosition.type, false);
            }

            if (currentTeam.positions.Count == 1 && currentTeam.positions[0].evolution == evolution.e1 &&
                UIController.instace.long_coin == 0)
            {
                for (int i = 0; i < start_ui.transform.childCount - 2; i++)
                {
                    start_ui.transform.GetChild(i).gameObject.SetActive(i == 0);
                }
            }
            else
            {
                UpdatePrice();
            }
        }

        var index = level;
        //Debug.LogError("load level: " + level);
        //levelobj.Reload();
        foreach (var enemy_data in level_data.levels[index].enemies)
        {
            if (enemy_data.animal_type == animal_type.animal)
            {
                var enemy_animal = levelobj.Spawn(enemy_animal_evolutions[(int) enemy_data.evolution])
                    .GetComponent<Enemy>();
                enemy_animal.SetData(animal_level_data.getData(enemy_data.animal_type, enemy_data.evolution));
            }
            else if (enemy_data.animal_type == animal_type.human)
            {
                var enemy_human = levelobj.Spawn(enemy_human_evolutions[(int) enemy_data.evolution])
                    .GetComponent<Enemy>();
                enemy_human.SetData(animal_level_data.getData(enemy_data.animal_type, enemy_data.evolution));
            }
        }

        tutorial.SetBtns(buy_human, notbuy_human, buy_animal, notbuy_animal);
        tutorial.LoadLevel(level);

        if (currentTeam != null && currentTeam.positions.Count == 15)
        {
            deactiveIfAllPositionFilled();
        }
    }


    public void UpdateButtonBuy()
    {
        txt_all_positio_filled.SetActive(false);
        if (UIController.instace.level_unlock + 1 <= 2 && UIController.instace.animal_level == 1 &&
            (UIController.instace.human_level == 1 && allies.Count > 1))
        {
            buy_animal.SetActive(false);
            notbuy_animal.SetActive(false);
            buy_human.SetActive(false);
            notbuy_human.SetActive(false);
            buy_animal2.SetActive(false);
            buy_human2.SetActive(false);
            return;
        }

        if (UIController.instace.long_coin < price_animal)
        {
            buy_animal.SetActive(false);
            notbuy_animal.SetActive(true);
            buy_animal2.SetActive(false);
        }
        else
        {
            buy_animal.SetActive(true);
            notbuy_animal.SetActive(false);

            long animalPrice7 = (long) (price_animal * bonus_price7);
            long animalPrice4 = (long) (price_animal * bonus_price4);
            if (UIController.instace.level_unlock > 5 && UIController.instace.long_coin >= animalPrice7)
            {
                i_animal4.SetActive(false);
                i_animal7.SetActive(true);
                buy_animal2.SetActive(true);
            }
            else if (UIController.instace.level_unlock > 5 && UIController.instace.long_coin >= animalPrice4)
            {
                i_animal4.SetActive(true);
                i_animal7.SetActive(false);
                buy_animal2.SetActive(true);
            }
            else
            {
                buy_animal2.SetActive(false);
            }
        }

        if (UIController.instace.long_coin < price_human)
        {
            buy_human.SetActive(false);
            notbuy_human.SetActive(true);
            buy_human2.SetActive(false);
        }
        else
        {
            buy_human.SetActive(true);
            notbuy_human.SetActive(false);

            long humanPrice7 = (long) (price_human * bonus_price7);
            long humanPrice4 = (long) (price_human * bonus_price4);
            if (UIController.instace.level_unlock > 5 && UIController.instace.long_coin >= humanPrice7)
            {
                i_human4.SetActive(false);
                i_human7.SetActive(true);
                buy_human2.SetActive(true);
            }
            else if (UIController.instace.level_unlock > 5 && UIController.instace.long_coin >= humanPrice4)
            {
                i_human4.SetActive(true);
                i_human7.SetActive(false);
                buy_human2.SetActive(true);
            }
            else
            {
                buy_human2.SetActive(false);
            }
        }
        
        var grids = grid.grids.ToList();
        foreach (var ally in allies)
        {
            if (grids.Contains(ally.grid))
            {
                grids.Remove(ally.grid);
            }
        }
        if (grids.Count == 0)
        {
            deactiveIfAllPositionFilled();
        }
    }

    public void UpdatePrice()
    {
        //DOVirtual.DelayedCall(0.2f, () =>
        {
            var trapCount = currentTrap.levels.Count;
            var trapTotalLevel = 1;
            foreach (var level in currentTrap.levels)
            {
                trapTotalLevel += level;
            }

            trap_price = (trapTotalLevel + trapCount) * 20000 + (long)Mathf.Pow(2, trapCount * 2.5f);
            if (trapCount == 0)
            {
                trap_price = 0;
            }
            else if (trapCount == 1)
            {
                trap_price = 20;
            }
            else if (trapCount == 2)
            {
                trap_price = 40;
            }
            else if (trapCount == 3)
            {
                trap_price = 80;
            }
            else if (trapCount == 4)
            {
                trap_price = 120;
            }
            trap_upgrade_pirce = (trapTotalLevel + trapCount) * 20000  + (long)Mathf.Pow(2, trapCount * 2f);
            txt_buy_trap.text = trap_price.GetNumberAroundString();
            txt_upgrade_trap.text = trap_upgrade_pirce.GetNumberAroundString();
            
            price_animal = (long) Mathf.Pow(2, UIController.instace.animal_level)
                           + UIController.instace.animal_spawn_count * UIController.instace.animal_spawn_count * 16;
            price_human = (long) Mathf.Pow(2, UIController.instace.human_level)
                          + UIController.instace.human_spawn_count * UIController.instace.human_spawn_count * 16;
            if (UIController.instace.animal_spawn_count == 1)
            {
                price_animal = 2;
            }

            price_animal = price_animal.GetNumberAround();
            price_human = price_human.GetNumberAround();


            txt_animal.text = price_animal.GetNumberAroundString();
            txt_animal.transform.GetChild(0).GetComponent<Text>().text = price_animal.GetNumberAroundString();
            txt_human.text = price_human.GetNumberAroundString();
            txt_human.transform.GetChild(0).GetComponent<Text>().text = price_human.GetNumberAroundString();

            long humanPrice7 = (long) (price_human * bonus_price7);
            long humanPrice4 = (long) (price_human * bonus_price4);
            if (UIController.instace.long_coin >= humanPrice7)
            {
                txt_human2.text = humanPrice7.GetNumberAroundString();
            }
            else if (UIController.instace.long_coin >= humanPrice4)
            {
                txt_human2.text = humanPrice4.GetNumberAroundString();
            }

            long animalPrice7 = (long) (price_animal * bonus_price7);
            long animalPrice4 = (long) (price_animal * bonus_price4);
            if (UIController.instace.long_coin >= animalPrice7)
            {
                txt_animal2.text = animalPrice7.GetNumberAroundString();
            }
            else if (UIController.instace.long_coin >= animalPrice4)
            {
                txt_animal2.text = animalPrice4.GetNumberAroundString();
            }


            UpdateButtonBuy();
            UIController.instace.UpdateAddCoinText();
        }
        //);
    }

    public void Merge(Ally a1, Ally a2, animal_type animalType)
    {
        var newLevel = (int) a1.evolution + 2;
        var newEvolution = (evolution) ((int) a1.evolution + 1);
        if (animalType == animal_type.animal && newLevel > UIController.instace.animal_level)
        {
            SoundControl.instance.PlayShot(SoundControl.instance.newlevel);
            UIController.instace.NewLevelPopup.Show(new List<int>() {0, newLevel - 1});
            UIController.instace.animal_level = newLevel;
        }
        else if (animalType == animal_type.human && newLevel > UIController.instace.human_level)
        {
            SoundControl.instance.PlayShot(SoundControl.instance.newlevel);
            UIController.instace.NewLevelPopup.Show(new List<int>() {1, newLevel - 1});
            UIController.instace.human_level = newLevel;
        }

        var grid = a1.grid;
        allies.Remove(a1);
        allies.Remove(a2);
        Destroy(a1.gameObject);
        Destroy(a2.gameObject);

        var index_pos1 = Array.IndexOf(this.grid.grids, a1.grid);
        var index_pos2 = Array.IndexOf(this.grid.grids, a2.grid);
        var teampos1 = currentTeam.positions.Find(x => x.index_pos == index_pos1);
        var teampos2 = currentTeam.positions.Find(x => x.index_pos == index_pos2);
        currentTeam.positions.Remove(teampos1);
        currentTeam.positions.Remove(teampos2);
        UIController.instace.current_team = JsonUtility.ToJson(currentTeam);


        SoundControl.instance.PlayShot(SoundControl.instance.merge);
        SpawnAlly(grid, newEvolution, animalType, true, false, true);

        UpdatePrice();
        tutorial.OnMerge();
        Vibration.Vibrate(100);
    }

    public void RemoveAlly(Ally a1)
    {
        var index_pos1 = Array.IndexOf(this.grid.grids, a1.grid);
        var teampos1 = currentTeam.positions.Find(x => x.index_pos == index_pos1);
        currentTeam.positions.Remove(teampos1);
        UIController.instace.current_team = JsonUtility.ToJson(currentTeam);
        allies.Remove(a1);
        Destroy(a1.gameObject);

        Vibration.Vibrate(100);
        UpdateButtonBuy();
    }

    public void SpawnAlly(Transform grid, evolution evolution, animal_type animalType, bool addToCached,
        bool startAtk = false, bool is_merge = false)
    {
        SoundControl.instance.PlayShot(SoundControl.instance.spawn);
        var index = (int) evolution;
        if (animalType == animal_type.animal)
        {
            var spawn = Instantiate(animal_evolutions[index], grid.position, Quaternion.identity);
            var ally = spawn.GetComponent<Ally>();
            ally.SetData(animal_level_data.getData(animalType, evolution), is_merge);
            ally.grid = grid;
            if (startAtk)
                ally.StartAttack();
        }
        else
        {
            var spawn = Instantiate(human_evolutions[index], grid.position, Quaternion.identity);
            var ally = spawn.GetComponent<Ally>();
            ally.SetData(animal_level_data.getData(animalType, evolution), is_merge);
            ally.grid = grid;
            if (startAtk)
                ally.StartAttack();
        }

        if (addToCached)
        {
            var index_pos = Array.IndexOf(this.grid.grids, grid);
            currentTeam.positions.Add(new team_position()
                {type = animalType, evolution = evolution, index_pos = index_pos});
            UIController.instace.current_team = JsonUtility.ToJson(currentTeam);
            if (animalType == animal_type.animal)
            {
                UIController.instace.animal_spawn_count++;
            }
            else
            {
                UIController.instace.human_spawn_count++;
            }
        }
    }

    public void MoveAllyToNewGrid(Transform oldGrid, Transform newGrid)
    {
        var old_pos = Array.IndexOf(this.grid.grids, oldGrid);
        var new_pos = Array.IndexOf(this.grid.grids, newGrid);
        var team_pos = currentTeam.positions.Find(x => x.index_pos == old_pos);
        team_pos.index_pos = new_pos;
        UIController.instace.current_team = JsonUtility.ToJson(currentTeam);
        tutorial.OnMoveAlly();
    }

    public void AddAlly(Ally ally)
    {
        allies.Add(ally);
        UIController.instace.ValidateBtnDelete();
    }

    public void RemoveAlly(Ally ally, bool isDead)
    {
        if (allies.Contains(ally))
        {
            allies.Remove(ally);
        }

        if (winstatus == winstatus.none && allies.Count == 0)
        {
            winstatus = winstatus.lose;
            foreach (var enemy in enemies)
            {
                enemy.Victory();
            }

            img_ally_hp.fillAmount = 0;
            DOVirtual.DelayedCall(2.5f, () =>
            {
                UIController.instace.WinPopup.Show(false);
                SoundControl.instance.PlayShot(SoundControl.instance.lose);
            });
        }

        if (isDead)
        {
            allies_dead.Add(ally);
        }
    }

    public void AddEnemy(Enemy enemy)
    {
        enemies.Add(enemy);
    }

    public void RemoveEnemy(Enemy enemy, bool isDead)
    {
        if (enemies.Contains(enemy))
        {
            enemies.Remove(enemy);
        }

        if (winstatus == winstatus.none && enemies.Count == 0)
        {
            winstatus = winstatus.win;
            foreach (var ally in allies)
            {
                ally.Victory();
            }

            img_enemy_hp.fillAmount = 0;
            DOVirtual.DelayedCall(0.5f, () => { win_par.Play(); });
            DOVirtual.DelayedCall(2.5f, () =>
            {
                UIController.instace.WinPopup.Show(true);
                SoundControl.instance.PlayShot(SoundControl.instance.win);
            });
        }

        if (isDead)
        {
            enemies_dead.Add(enemy);
        }
    }

    [ContextMenu("start battle")]
    public void StartBattle()
    {
        if (!tutorial.CompleteTutorial())
        {
            UIController.instace.NotiPopup.ShowNoti("Follow the hand instructions", false);
            return;
        }

        if (allies.Count == 0)
        {
            UIController.instace.NotiPopup.ShowNoti("Drop an ally", false);
            return;
        }

        foreach (var ally in allies)
        {
            ally.StartAttack();
        }

        foreach (var enemy in enemies)
        {
            enemy.StartAttack();
        }

        start_ui.SetActive(false);
        grid.StartFight();
        foreach (var trap in traps)
        {
            if (trap.gameObject.activeInHierarchy)
            {
                trap.StartFight();
            }
        }
        
        var grids = grid.grids.ToList();
        foreach (var ally in allies)
        {
            if (grids.Contains(ally.grid))
            {
                grids.Remove(ally.grid);
            }
        }

        // if (UIController.instace.level_unlock >= 2 && grids.Count > 0)
        // {
        //     btnAddAnimal.SetActive(true);
        // }
        var camera = Camera.main.transform;
        camera.DOMove(new Vector3(0, 16.76f, -11.09f), 1f);
        camera.DORotate(new Vector3(60, 0, 0), 1f);
        UIController.instace.HideBtnDelete();
        btn_delete.SetActive(false);
        //btn_shop.SetActive(false);


        foreach (var ally in allies)
        {
            ally_hp += ally.hp;
        }
        foreach (var enemy in enemies)
        {
            enemy_hp += enemy.hp;
        }

        current_ally_hp = ally_hp;
        current_enemy_hp = enemy_hp;
    }

    public void UpdateAllyHp(long damage)
    {
        if (winstatus != winstatus.none)
        {
            return;
        }
        current_ally_hp -= damage;
    }

    public void UpdateEnemyHp(long damage)
    {
        if (winstatus != winstatus.none)
        {
            return;
        }
        current_enemy_hp -= damage;
    }

    public void BuyTrap()
    {
        if (UIController.instace.long_coin < trap_price)
        {
            UIController.instace.NotiPopup.ShowNoti("Not enough money", false);
            return;
        }
        if (currentTrap.levels.Count < 15)
        {
            currentTrap.levels.Add(1);
            traps[currentTrap.levels.Count - 1].gameObject.SetActive(true);
            traps[currentTrap.levels.Count - 1].SetDamage(1, animal_level_data.human_levels[0].damage);
            UIController.instace.current_trap = JsonUtility.ToJson(currentTrap);
            UpdatePrice();
        }
    }

    public void UpgradeTrap()
    {
        if (UIController.instace.long_coin < trap_upgrade_pirce)
        {
            UIController.instace.NotiPopup.ShowNoti("Not enough money", false);
            return;
        }
        if (currentTrap.levels.Count == 0)
        {
            UIController.instace.NotiPopup.ShowNoti("Unlock new trap first!", true);
            return;
        }

        int minLevel = 5;
        int index = -1;
        for (int i = currentTrap.levels.Count - 1; i >= 0; i--)
        {
            if (currentTrap.levels[i] < minLevel)
            {
                minLevel = currentTrap.levels[i];
                index = i;
            }
        }

        if (index != -1)
        {
            currentTrap.levels[index]++;
            UIController.instace.current_trap = JsonUtility.ToJson(currentTrap);
            var damage = animal_level_data.human_levels[currentTrap.levels[index] - 1].damage;
            traps[index].SetDamage(currentTrap.levels[index], damage);
            UIController.instace.current_trap = JsonUtility.ToJson(currentTrap);
        }
        else if (currentTrap.levels.Count < 15)
        {
            UIController.instace.NotiPopup.ShowNoti("Unlock new trap", true);
        }
        UpdatePrice();
    }

    public void BuyAnimal()
    {
        if (UIController.instace.long_coin < price_animal)
        {
            UIController.instace.NotiPopup.ShowNoti("Not enough money", false);
            return;
        }

        var grids = grid.grids.ToList();
        foreach (var ally in allies)
        {
            if (grids.Contains(ally.grid))
            {
                grids.Remove(ally.grid);
            }
        }

        //Debug.LogError("grid count: " + grids.Count);
        // if (grids.Count == 0)
        // {
        //     UIController.instace.NotiPopup.ShowNoti("All positions are filled", false);
        //     deactiveIfAllPositionFilled();
        //     return;
        // }

        UIController.instace.long_coin -= price_animal;
        UIController.instace.PanelMoney.CountCoin(UIController.instace.long_coin);
        UpdatePrice();
        if (grids.Count == 1)
        {
            deactiveIfAllPositionFilled();
        }

        if (UIController.instace.level_unlock + 1 == 2 && allies.Count == 2 && grids.Contains(grid.grids[11]))
        {
            SpawnAlly(grid.grids[11], evolution.e1, animal_type.animal, true);
        }
        else SpawnAlly(grids[Random.Range(0, grids.Count)], evolution.e1, animal_type.animal, true);

        tutorial.OnClickBuyAnimal();
    }

    public float bonus_price4 => 3 * Mathf.Pow(2, 4);
    public float bonus_price7 => 5 * Mathf.Pow(2, 7);

    public void BuyAnimal2()
    {
        long animalPrice7 = (long) (price_animal * bonus_price7);
        long animalPrice4 = (long) (price_animal * bonus_price4);
        var isAnimal7 = i_animal7.activeInHierarchy;
        var isAnimal4 = !isAnimal7;
        if (isAnimal4 && UIController.instace.long_coin < animalPrice4 ||
            isAnimal7 && UIController.instace.long_coin < animalPrice7)
        {
            UIController.instace.NotiPopup.ShowNoti("Not enough money", false);
            return;
        }

        var grids = grid.grids.ToList();
        foreach (var ally in allies)
        {
            if (grids.Contains(ally.grid))
            {
                grids.Remove(ally.grid);
            }
        }

        //Debug.LogError("grid count: " + grids.Count);
        // if (grids.Count == 0)
        // {
        //     UIController.instace.NotiPopup.ShowNoti("All positions are filled", false);
        //     deactiveIfAllPositionFilled();
        //     return;
        // }

        if (isAnimal7)
        {
            UIController.instace.long_coin -= animalPrice7;
            SpawnAlly(grids[Random.Range(0, grids.Count)], evolution.e7, animal_type.animal, true);
        }
        else if (isAnimal4)
        {
            UIController.instace.long_coin -= animalPrice4;
            SpawnAlly(grids[Random.Range(0, grids.Count)], evolution.e4, animal_type.animal, true);
        }

        Debug.LogError("coin: " + UIController.instace.long_coin);
        UIController.instace.PanelMoney.CountCoin(UIController.instace.long_coin);
        UpdatePrice();
        if (grids.Count == 1)
        {
            deactiveIfAllPositionFilled();
        }

        tutorial.OnClickBuyAnimal();
    }

    public void BuyAnimalByAds()
    {
        var grids = grid.grids.ToList();
        foreach (var ally in allies)
        {
            if (grids.Contains(ally.grid))
            {
                grids.Remove(ally.grid);
            }
        }

        // if (grids.Count == 0)
        // {
        //     UIController.instace.NotiPopup.ShowNoti("All positions are filled", false);
        //     deactiveIfAllPositionFilled();
        //     return;
        // }

        AdsAdapter.instance.ShowRewardedVideo(
            () =>
            {
                if (grids.Count == 1)
                {
                    deactiveIfAllPositionFilled();
                }

                SpawnAlly(grids[Random.Range(0, grids.Count)], evolution.e1, animal_type.animal, true);
            },
            () => UIController.instace.NotiPopup.ShowNoti("Try again", false), "buy_animal_start");
    }

    public void BuyBow()
    {
        if (UIController.instace.long_coin < price_human)
        {
            UIController.instace.NotiPopup.ShowNoti("Not enough money", false);
            return;
        }

        var grids = grid.grids.ToList();
        foreach (var ally in allies)
        {
            if (grids.Contains(ally.grid))
            {
                grids.Remove(ally.grid);
            }
        }

        //Debug.LogError("grids count: " + grids.Count);
        // if (grids.Count == 0)
        // {
        //     UIController.instace.NotiPopup.ShowNoti("All positions are filled", false);
        //     deactiveIfAllPositionFilled();
        //     return;
        // }

        UIController.instace.long_coin -= price_human;
        UIController.instace.PanelMoney.CountCoin(UIController.instace.long_coin);
        UpdatePrice();
        if (grids.Count == 1)
        {
            deactiveIfAllPositionFilled();
        }

        if (UIController.instace.level_unlock + 1 == 1 && allies.Count == 1 && grids.Contains(grid.grids[1]))
        {
            SpawnAlly(grid.grids[1], evolution.e1, animal_type.human, true);
        }
        else SpawnAlly(grids[Random.Range(0, grids.Count)], evolution.e1, animal_type.human, true);

        tutorial.OnClickBuyHuman();
    }

    public void BuyBow2()
    {
        long humanPrice7 = (long) (price_human * bonus_price7);
        long humanPrice4 = (long) (price_human * bonus_price4);
        var isHuman7 = i_human7.activeInHierarchy;
        var isHuman4 = !isHuman7;
        if (isHuman4 && UIController.instace.long_coin < humanPrice4 ||
            isHuman7 && UIController.instace.long_coin < humanPrice7)
        {
            UIController.instace.NotiPopup.ShowNoti("Not enough money", false);
            return;
        }

        var grids = grid.grids.ToList();
        foreach (var ally in allies)
        {
            if (grids.Contains(ally.grid))
            {
                grids.Remove(ally.grid);
            }
        }

        //Debug.LogError("grid count: " + grids.Count);
        // if (grids.Count == 0)
        // {
        //     UIController.instace.NotiPopup.ShowNoti("All positions are filled", false);
        //     deactiveIfAllPositionFilled();
        //     return;
        // }

        if (isHuman7)
        {
            UIController.instace.long_coin -= humanPrice7;
            SpawnAlly(grids[Random.Range(0, grids.Count)], evolution.e7, animal_type.human, true);
        }
        else if (isHuman4)
        {
            UIController.instace.long_coin -= humanPrice4;
            SpawnAlly(grids[Random.Range(0, grids.Count)], evolution.e4, animal_type.human, true);
        }

        UIController.instace.PanelMoney.CountCoin(UIController.instace.long_coin);
        UpdatePrice();
        if (grids.Count == 1)
        {
            deactiveIfAllPositionFilled();
        }

        tutorial.OnClickBuyAnimal();
    }


    public void BuyBowByAds()
    {
        var grids = grid.grids.ToList();
        foreach (var ally in allies)
        {
            if (grids.Contains(ally.grid))
            {
                grids.Remove(ally.grid);
            }
        }

        // if (grids.Count == 0)
        // {
        //     UIController.instace.NotiPopup.ShowNoti("All positions are filled", false);
        //     deactiveIfAllPositionFilled();
        //     return;
        // }

        AdsAdapter.instance.ShowRewardedVideo(
            () =>
            {
                if (grids.Count == 1)
                {
                    deactiveIfAllPositionFilled();
                }

                SpawnAlly(grids[Random.Range(0, grids.Count)], evolution.e1, animal_type.human, true);
            },
            () => UIController.instace.NotiPopup.ShowNoti("Try again", false), "buy_human_start");
    }

    void deactiveIfAllPositionFilled()
    {
        buy_animal.SetActive(false);
        notbuy_animal.SetActive(false);
        buy_human.SetActive(false);
        notbuy_human.SetActive(false);
        txt_all_positio_filled.SetActive(true);

        buy_animal2.SetActive(false);
        buy_human2.SetActive(false);
        // btnAddAnimal.SetActive(false);
    }

    public void AddAllyInBattle()
    {
        var grids = grid.grids.ToList();
        foreach (var ally in allies)
        {
            if (grids.Contains(ally.grid))
            {
                grids.Remove(ally.grid);
            }
        }

        foreach (var ally in allies_dead)
        {
            if (grids.Contains(ally.grid))
            {
                grids.Remove(ally.grid);
            }
        }

        // if (grids.Count == 0)
        // {
        //     UIController.instace.NotiPopup.ShowNoti("All positions are filled", false);
        //     deactiveIfAllPositionFilled();
        //     return;
        // }

        AdsAdapter.instance.ShowRewardedVideo(
            () =>
            {
                if (grids.Count == 1)
                {
                    deactiveIfAllPositionFilled();
                }

                SpawnAlly(grids[Random.Range(0, grids.Count)], evolution.e1, animal_type.animal, true, true);
            },
            () => UIController.instace.NotiPopup.ShowNoti("Try again", false), "buy_ally_in_battle");
    }

    private float life_time;

    private void Update()
    {
        life_time += Time.deltaTime;
        if (tutorial)
        {
            if (cur_level <= 2 && life_time > 2f || cur_level > 2 && life_time > 0.5f)
            {
                if (!tutorial.CompleteTutorial())
                {
                    btn_start.SetActive(false);
                }
                else btn_start.SetActive(true);
            }
        }
    }
}

public static class Vibration
{
#if UNITY_ANDROID && !UNITY_EDITOR
    public static AndroidJavaClass unityPlayer = new AndroidJavaClass("com.unity3d.player.UnityPlayer");
    public static AndroidJavaObject currentActivity = unityPlayer.GetStatic<AndroidJavaObject>("currentActivity");
    public static AndroidJavaObject vibrator = currentActivity.Call<AndroidJavaObject>("getSystemService", "vibrator");
#else
    public static AndroidJavaClass unityPlayer;
    public static AndroidJavaObject currentActivity;
    public static AndroidJavaObject vibrator;
#endif

    public static void Vibrate()
    {
        if (UIController.instace.vibrate == 0)
        {
            return;
        }

        if (isAndroid())
            vibrator.Call("vibrate");
        else
            Handheld.Vibrate();
    }


    public static void Vibrate(long milliseconds)
    {
        if (UIController.instace.vibrate == 0)
        {
            return;
        }

        if (isAndroid())
            vibrator.Call("vibrate", milliseconds);
        else
            Handheld.Vibrate();
    }

    public static bool HasVibrator()
    {
        return isAndroid();
    }

    public static void Cancel()
    {
        if (isAndroid())
            vibrator.Call("cancel");
    }

    private static bool isAndroid()
    {
#if UNITY_ANDROID && !UNITY_EDITOR
	return true;
#else
        return false;
#endif
    }
}
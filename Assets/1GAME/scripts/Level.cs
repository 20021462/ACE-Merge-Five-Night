using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Level : MonoBehaviour
{
    public List<Transform> slots;
    private Queue<Transform> queues;
    private Transform enemy_pool;
    public Transform map_parent;
    public List<GameObject> maps;

    private void Awake()
    {
        foreach (var slot in slots)
        {
            slot.GetChild(0).gameObject.SetActive(false);
        }
    }

    public void Reload(int map_index)
    {
        queues = new Queue<Transform>(slots);
        // if (enemy_pool != null)
        // {
        //     Destroy(enemy_pool.gameObject);
        // }
        enemy_pool = new GameObject("enemy_pool").transform;
        enemy_pool.SetParent(transform);
        enemy_pool.localPosition = Vector3.zero;
        enemy_pool.localEulerAngles = Vector3.zero;
        enemy_pool.localScale = Vector3.one;

        if (map_index >= maps.Count)
        {
            map_index = maps.Count - 1;
        }
        var map = Instantiate(maps[UnityEngine.Random.Range(0, maps.Count)], map_parent);
        map.transform.localScale = Vector3.one;
        map.transform.localPosition  = Vector3.zero;
        map.transform.localEulerAngles = Vector3.zero;
    }

    public GameObject Spawn(GameObject animal)
    {
        var spawn = Instantiate(animal, enemy_pool);
        spawn.transform.position = queues.Dequeue().position;
        return spawn;
    }

    public void OnClickGift()
    {
        UIController.instace.GiftPopup.Show(null);
    }
}
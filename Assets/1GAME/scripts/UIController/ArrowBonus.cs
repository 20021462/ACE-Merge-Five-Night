using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ArrowBonus : MonoBehaviour
{
    public Transform child;
    public int bonus;
    public Action onChangeBonus;
    public List<BoxRW> box_rws;

    int last_index = -1;

    private void Update()
    {
        var distance = Mathf.Infinity;
        var index = -1;
        for (int i = 0; i < box_rws.Count; i++)
        {
            var dis = Vector3.Distance(child.position, box_rws[i].transform.position);
            if (dis < distance)
            {
                distance = dis;
                index = i;
            }
        }

        if (index != -1 && last_index != index)
        {
            last_index = index;
            bonus = box_rws[index].RW;
            onChangeBonus?.Invoke();
        }
    }
}
using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;

public class Trap : MonoBehaviour
{
    public Transform strike;
    private Collider col;
    private int damage;
    public List<GameObject> levels;

    private void Awake()
    {
        col = GetComponent<Collider>();
        col.enabled = false;
    }

    public void SetDamage(int level, int damage)
    {
        this.damage = damage;
        for (int i = 0; i < levels.Count; i++)
        {
            levels[i].SetActive(i < level);
        }

        // strike.DOLocalMove(Vector3.zero, 1).OnComplete(() =>
        // {
        //     strike.DOLocalMove(new Vector3(0, -1.5f, 0), 1);
        // });
    }
    public void StartFight()
    {
        StartCoroutine(IEStart());
    }
    IEnumerator IEStart()
    {
        while (true)
        {
            col.enabled = true;
            yield return strike.DOLocalMove(Vector3.zero, 1).WaitForCompletion();
            yield return new WaitForSeconds(1);
            col.enabled = false;
            yield return strike.DOLocalMove(new Vector3(0, -1.5f, 0), 1).WaitForCompletion();
        }
    }
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("enemy"))
        {
            var enemy = other.GetComponent<Enemy>();
            enemy.TakeDamage(damage , false);
        }
    }
}

using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using Random = UnityEngine.Random;

public enum currency
{
    coin,
    star
}

public class PanelMoney : MonoBehaviour
{
    public currency currency;
    public Text txtCoin, txtCoinFake;

    [Header("EFFECT COIN")] [SerializeField]
    GameObject Coin;

    [SerializeField] [Range(1, 20)] int maxClone;
    [SerializeField] float distance;
    [SerializeField] float maxDuration;
    [SerializeField] float minDuration;
    [SerializeField] Ease easeType;
    Queue<GameObject> effectQueueCoin = new Queue<GameObject>();

    private IEnumerator Start()
    {
        yield return null;
        Init();
    }

    void Init()
    {
        if (currency == currency.coin)
        {
            txtCoin.text = UIController.instace.long_coin.ToString();
            txtCoinFake.text = UIController.instace.long_coin.GetNumberAroundString();
        }
        else
        {
        }
    }

    public void CountCoin(long totalValue)
    {
        StartCoroutine(IECountCoin(totalValue));
    }

    IEnumerator IECountCoin(long totalValue)
    {
        long coin = long.Parse(txtCoin.text);


        long dis = (long)Mathf.Abs(totalValue - coin);
        long step = 1;
        if (dis >= 10_000_000_000)
        {
            step = 10_000_000_000;
        }
        else if (dis >= 1_000_000_000)
        {
            step = 1_000_000_000;
        }
        else if (dis >= 100_000_000)
        {
            step = 100_000_000;
        }
        else if (dis >= 10_000_000)
        {
            step = 1_000_000;
        }
        else if (dis >= 1_000_000)
        {
            step = 100_000;
        }
        else if (dis >= 100_000)
        {
            step = 10_000;
        }
        else if (dis >= 10_000)
        {
            step = 1000;
        }
        else if (dis >= 1000)
        {
            step = 200;
        }
        else if (dis >= 100)
        {
            step = 100;
        }
        else if (dis >= 10)
        {
            step = 10;
        }
        else
        {
            step = 1;
        }

        if (coin < totalValue)
        {
            while (coin < totalValue)
            {
                coin += step;
                txtCoin.text = coin.ToString();
                txtCoinFake.text = coin.GetNumberAroundString();
                yield return new WaitForSeconds(0.01f);
            }
        }
        else
        {
            while (coin > totalValue)
            {
                coin -= step;
                txtCoin.text = coin.ToString();
                txtCoinFake.text = coin.GetNumberAroundString();
                yield return new WaitForSeconds(0.01f);
            }
        }

        if (coin < 0)
            coin = 0;
        txtCoin.text = coin.ToString();
        txtCoinFake.text = coin.GetNumberAroundString();
    }

    void SpawnEffect(Vector3 pos)
    {
        GameObject effect, efPrefab;
        Queue<GameObject> effectQueue = new Queue<GameObject>();
        efPrefab = Coin;

        effectQueue.Clear();
        for (int i = 0; i < maxClone; i++)
        {
            effect = Instantiate(efPrefab, transform);
            effect.transform.SetParent(transform);
            effect.transform.position = pos;
            effect.SetActive(false);
            // effect.transform.localScale = new Vector3(0.5f, 0.5f, 0.5f);
            effectQueue.Enqueue(effect);
        }

        effectQueueCoin.Clear();
        effectQueueCoin = effectQueue;
    }

    void Animated(Vector3 collectedPos)
    {
        Queue<GameObject> effectQueue = new Queue<GameObject>();
        SpawnEffect(collectedPos);

        DOVirtual.DelayedCall(0.2f, () =>
        {
            effectQueue = effectQueueCoin;
            for (int i = 0; i < maxClone; i++)
            {
                if (effectQueue.Count > 0)
                {
                    GameObject effect = effectQueue.Dequeue();
                    effect.SetActive(true);

                    Vector3 position = collectedPos + new Vector3(Random.Range(-distance, distance),
                        Random.Range(-distance, distance), 0f);
                    DOVirtual.DelayedCall(0.05f * i, () =>
                    {
                        effect.transform.DOMove(position, 0.2f).SetUpdate(true).OnComplete(() =>
                        {
                            float time = Random.Range(minDuration, maxDuration);
                            // effect.transform.DOScale(new Vector3(1, 1, 1), time);
                            GameObject target = Coin;
                            effect.transform.DOMove(target.transform.position, time).SetEase(easeType).OnComplete(() =>
                            {
                                effect.SetActive(false);
                            }).SetUpdate(true);
                        });
                    });
                }
            }
        });
    }

    public void Effect(Vector3 posCollect)
    {
        SoundControl.instance.PlayShot(SoundControl.instance.coin);
        Animated(posCollect);
    }
}
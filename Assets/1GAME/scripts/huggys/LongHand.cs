using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;
using Random = UnityEngine.Random;

public class LongHand : MonoBehaviour
{
    public Transform left_hand, right_hand;
    public Transform left_long, right_long;
    public float left_duration, right_duration;
    private Vector3 left_hand_pos, right_hand_pos;
    private Vector3 left_long_pos, right_long_pos;

    private void Awake()
    {
        var ally = GetComponentInParent<Ally>();

        if (ally)
        {
            ally.on_mele_attack_target = DoLongHand;
            ally.ondead = OnDead;
        }
        else
        {
            var enemy = GetComponentInParent<Enemy>();
            if (enemy)
            {
                enemy.on_mele_attack_target = DoLongHand;
                enemy.ondead = OnDead;
            }
        }

        left_hand_pos = left_hand.localPosition;
        right_hand_pos = right_hand.localPosition;
        left_long_pos = left_long.localPosition;
        right_long_pos = right_long.localPosition;
    }

    void OnDead()
    {
        left_long.DOScaleZ(1, left_duration);
        left_long.DOLocalMoveZ(left_long_pos.z, left_duration);
        left_hand.DOLocalMoveZ(left_hand_pos.z, left_duration);

        right_long.DOScaleZ(1, right_duration);
        right_long.DOLocalMoveZ(right_long_pos.z, right_duration);
        right_hand.DOLocalMoveZ(right_hand_pos.z, right_duration);
    }

    void DoLongHand(Transform target)
    {
        var distance = Vector3.Distance(target.position, transform.position) + 2;
        var leftDelay = 0.1f;
        var rightDelay = 0f;
        if (Random.Range(0, 2) == 0)
        {
            leftDelay = 0f;
            rightDelay = 0.1f;
        }

        left_long.DOScaleZ(distance, left_duration).SetDelay(leftDelay);
        left_long.DOLocalMoveZ(left_long_pos.z - distance / 2, left_duration).SetDelay(leftDelay);
        left_hand.DOLocalMoveZ(left_hand_pos.z - distance + 0.5f, left_duration).SetDelay(leftDelay);

        right_long.DOScaleZ(distance, right_duration).SetDelay(rightDelay);
        right_long.DOLocalMoveZ(right_long_pos.z - distance / 2, right_duration).SetDelay(rightDelay);
        right_hand.DOLocalMoveZ(right_hand_pos.z - distance + 0.5f, right_duration).SetDelay(rightDelay);

        DOVirtual.DelayedCall(left_duration + 0.1f, () =>
        {
            leftDelay /= 2;
            rightDelay /= 2;
            left_long.DOScaleZ(1, left_duration).SetDelay(leftDelay);
            left_long.DOLocalMoveZ(left_long_pos.z, left_duration).SetDelay(leftDelay);
            left_hand.DOLocalMoveZ(left_hand_pos.z, left_duration).SetDelay(leftDelay);

            right_long.DOScaleZ(1, right_duration).SetDelay(rightDelay);
            right_long.DOLocalMoveZ(right_long_pos.z, right_duration).SetDelay(rightDelay);
            right_hand.DOLocalMoveZ(right_hand_pos.z, right_duration).SetDelay(rightDelay);
        });
    }
}
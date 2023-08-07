using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;
using Random = UnityEngine.Random;

public class Arrow : MonoBehaviour
{
    private int damage;
    private bool allyteam;
    private bool trigger_target;
    // public ParticleSystem par;
    private Vector3 start_pos;
    public Transform body;
    public ParticleSystem smoke;

    private void OnEnable()
    {
        smoke.Clear();
        smoke.Play();
        if (body.transform.name == "rotate")
        {
            body.DOKill();
            body.DORotate(Random.onUnitSphere * 1440, 3);
        }
    }

    public void SetMove(bool allyteam, Vector3 startpos, Vector3 target, int damage, float throw_speed)
    {
        trigger_target = false;
        this.allyteam = allyteam;
        this.damage = damage;
        gameObject.SetActive(true);
        transform.position = startpos;
        this.start_pos = startpos;

        var direct = target - startpos;
        var angle = Mathf.Atan2(direct.x, direct.z) * Mathf.Rad2Deg;
        transform.eulerAngles = new Vector3(0, angle, 0);
        transform.DOKill();
        transform.localScale = Vector3.one;
        var distance = Vector3.Distance(transform.position, target);
        float jumpPower = 0.3f;
        if (distance >= 10)
        {
            jumpPower = 2;
        }
        else if (distance >= 8)
        {
            jumpPower = 1.5f;
        } 
        else if (distance >= 6)
        {
            jumpPower = 0.7f;
        }

        float duration = 1;
        if (distance <= 6)
        {
            duration = 0.3f;
        }
        else if (distance <= 8)
        {
            duration = 0.5f;
        }

        if(transform.position.y > 4.5f){
            transform.DOMove(target, throw_speed).SetSpeedBased().SetEase(Ease.Linear).OnComplete(
                () => { gameObject.SetActive(false); });
        }
        else
        {
            transform.DOJump(target, jumpPower, 1, duration).SetEase(Ease.Linear).OnComplete(
                () => { gameObject.SetActive(false); });
        }
    }

    // private void OnEnable()
    // {
    //     par.Play();
    // }
    //
    // private void OnDisable()
    // {
    //     par.Stop();
    // }

    private void OnCollisionEnter(Collision other)
    {
        if (trigger_target)
        {
            return;
        }
        if (allyteam && other.transform.CompareTag("enemy"))
        {
            var enemy = other.transform.GetComponent<Enemy>();
            if (enemy != null && !enemy.dead)
            {
                trigger_target = true;
                transform.DOKill();
                //transform.position = start_pos;
                transform.DOScale(0, 0.2f).OnComplete(
                    () => { gameObject.SetActive(false); });
                enemy.TakeDamageByArrow(damage, other.GetContact(0).point);
            }
        }
        else if (!allyteam && other.transform.CompareTag("ally"))
        {
            var ally = other.transform.GetComponent<Ally>();
            if (ally != null && !ally.dead)
            {
                trigger_target = true;
                transform.DOKill();
                //transform.position = start_pos;
                transform.DOScale(0, 0.2f).OnComplete(
                    () => { gameObject.SetActive(false); });
                ally.TakeDamageByArrow(damage, other.GetContact(0).point);
            }
        }
    }
}
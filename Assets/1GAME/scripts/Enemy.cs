using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;
using Random = UnityEngine.Random;

public class Enemy : MonoBehaviour
{
    public GameObject rip;
    public animal_type animalType;
    public evolution evolution;
    public bool is_layer_animator2;
    public bool is_long_hand;
    public int hp = 10;
    private int curhp;
    public int damage = 1;
    public float attack_dur = 1;
    public float move_speed = 10;
    private float throw_speed = 15;
    public Transform throw_position;
    public Arrow[] throw_objects;
    private Queue<Arrow> throw_objects_queue;
    public Transform body;
    public Image hp_fill;
    public Text[] txt_moneys;
    private Queue<Text> txt_moneys_queue;
    public ParticleSystem[] atk_pars;
    private Queue<ParticleSystem> atk_par_queue;
    public List<GameObject> combat_fxs;

    public bool dead;
    private bool start_attack;
    private bool attacking;
    public Animator anim;
    public AnimationClip idle, walk, die, victory;
    public AnimationClip[] attacks;
    [Header("runtime")] public Ally ally_attack_to;
    Ally ally_move_to;
    private bool win;
    private float anim_speed = 1.5f;
    public Action<Transform> on_mele_attack_target;
    public Action ondead;

    public void SetData((int hp, int damage, float attack_dur, float move_speed) data)
    {
        this.hp = data.hp;
        this.damage = data.damage;
        this.attack_dur = data.attack_dur;
        this.move_speed = data.move_speed;
        hp_fill.fillAmount = 1;
    }

    IEnumerator Start()
    {
        txt_moneys_queue = new Queue<Text>(txt_moneys);
        throw_objects_queue = new Queue<Arrow>(throw_objects);
        atk_par_queue = new Queue<ParticleSystem>(atk_pars);
        yield return null;
        LevelControl.instance.AddEnemy(this);
        if (is_layer_animator2)
        {
            anim.SetLayerWeight(1, 1);
        }
        if (anim)
        {
            anim.speed = anim_speed;
        }

        if (animalType == animal_type.animal)
        {
            SoundControl.instance.PlayShot(SoundControl.instance.enemy_spawn);
        }
    }

    public void Victory()
    {
        win = true;
        if (victory != null)
        {
            anim?.Play(victory.name);
        }
    }

    public void StartAttack()
    {
        dead = false;
        curhp = hp;
        start_attack = true;
        if (animalType == animal_type.human)
        {
            // rig.constraints = RigidbodyConstraints.FreezeAll;
            StartCoroutine(IEMeleAttack());
        }
    }

    private IEnumerator ieMeleAttack;

    IEnumerator IEMeleAttack()
    {
        float delay = 0.7f / anim_speed;
        Ally allyTarget = AllyGetAllyNearest();
        while (true)
        {
            //refind: ;
            float dur = attack_dur - delay;
            if (is_long_hand)
            {
                dur -= 0.5f;
            }

            while (dur > 0)
            {
                if (allyTarget == null)
                {
                    yield break;
                }
                else if (allyTarget.dead)
                {
                    allyTarget = AllyGetAllyNearest();
                    //goto refind;
                }

                dur -= Time.deltaTime;
                var direct = allyTarget.transform.position - transform.position;
                var angle = Mathf.Atan2(direct.x, direct.z) * Mathf.Rad2Deg;
                body.eulerAngles = new Vector3(0, angle, 0);
                yield return null;
            }

            if (dead || LevelControl.instance.allies.Count == 0)
            {
                attacking = false;
                yield break;
            }

            if (allyTarget != null && !allyTarget.dead)
            {
                var attack = attacks[Random.Range(0, attacks.Length)];
                anim?.Play(attack.name);

                yield return new WaitForSeconds(delay);
                if (dead || LevelControl.instance.allies.Count == 0)
                {
                    attacking = false;
                    yield break;
                }

                if (is_long_hand)
                {
                    SoundControl.instance.PlayShot(SoundControl.instance.grab_back);
                }
                else
                    SoundControl.instance.PlayShot(SoundControl.instance.bowing);

                if (!is_long_hand)
                {
                    var obj = throw_objects_queue.Dequeue();
                    throw_objects_queue.Enqueue(obj);
                    obj.SetMove(false, throw_position.position, allyTarget.transform.position, damage, throw_speed);
                }
                else
                {
                    on_mele_attack_target?.Invoke(allyTarget.transform);
                    DOVirtual.DelayedCall(0.2f, () => allyTarget.TakeDamage(damage, false));
                    yield return new WaitForSeconds(0.7f);
                }

                var direct = allyTarget.transform.position - transform.position;
                var angle = Mathf.Atan2(direct.x, direct.z) * Mathf.Rad2Deg;
                body.eulerAngles = new Vector3(0, angle, 0);
            }
        }
    }


    private float text_show_at;

    public void TakeDamage(int damage, bool byArrow)
    {
        if (curhp <= 0)
        {
            return;
        }
        // foreach (var mesh in anim.transform.GetComponentsInChildren<MeshRenderer>())
        // {
        //     var color = mesh.material.color;
        //     var colorDamage = color * 5;
        //     mesh.material.DOColor(Color.red, 0.1f).OnComplete(() =>
        //     {
        //         mesh.material.DOColor(color, 0.1f);
        //     });
        // }


        curhp -= damage;
        LevelControl.instance.UpdateEnemyHp(damage);
        float factor = 0.25f;
        var level = UIController.instace.level_unlock + 1;
        if (level >= 2 && level <= 4)
        {
            factor = 0.125f;
        }
        else if (level >= 5)
        {
            factor = 0.7f;
        }
        else if (level >= 6)
        {
            factor = 0.6f;
        }
        else if (level >= 7)
        {
            factor = 0.8f;
        }
        else if (level >= 9)
        {
            factor = 1f;
        }
        else if (level >= 12)
        {
            factor = 1.3f;
        }
        else if (level >= 15)
        {
            factor = 1.5f;
        }
        else if (level >= 17)
        {
            factor = 1.8f;
        }
        else if (level >= 20)
        {
            factor = 2f;
        }

        var coin = (long) (UIController.instace.human_level * UIController.instace.animal_level * damage * factor);

        LevelControl.instance.coin += coin;

        UIController.instace.long_coin += (long) coin;

        UIController.instace.PanelMoney.CountCoin(UIController.instace.long_coin);
        if (byArrow)
        {
            SoundControl.instance.PlayShot(SoundControl.instance.takedamage_bowing);
        }
        else SoundControl.instance.PlayShot(SoundControl.instance.takedamage);

        StartCoroutine(ieShowText(coin));

        var ratio = Mathf.Clamp01((float) curhp / (float) hp);
        DOTween.To(() => hp_fill.fillAmount, value => hp_fill.fillAmount = value, ratio, 0.2f);
        // anim.Play(takedamage.name);
        if (curhp <= 0)
        {
            Dead();
        }

        var atk_par = atk_par_queue.Dequeue();
        atk_par_queue.Enqueue(atk_par);
        atk_par.transform.position = transform.position;
        // atk_par.Clear();
        atk_par.Play();
        Vibration.Vibrate(100);

        if (Random.Range(0, 3) == 0)
        {
            var combatIndex = UnityEngine.Random.Range(0, combat_fxs.Count);
            int timeout = 100;
            while (combat_fxs[combatIndex].activeInHierarchy && timeout > 0)
            {
                timeout--;
                combatIndex = UnityEngine.Random.Range(0, combat_fxs.Count);
            }

            var fx = combat_fxs[combatIndex];
            if (!fx.activeInHierarchy)
            {
                fx.gameObject.SetActive(true);
                fx.transform.localScale = Vector3.zero;
                fx.transform.localPosition = Random.onUnitSphere * 1f;
                fx.transform.DOShakeRotation(1, 30, 20);
                fx.transform.DOScale(Random.Range(1.2f, 1.5f), 0.3f);
                DOVirtual.DelayedCall(1, () => fx.transform.DOScale(0, 1).OnComplete(() => { fx.SetActive(false); }));
            }
        }
    }

    IEnumerator ieShowText(long damage)
    {
        if (Time.time - text_show_at < 0.3f)
        {
            yield return new WaitForSeconds(0.3f - (Time.time - text_show_at));
        }

        var txt_money = txt_moneys_queue.Dequeue();
        txt_moneys_queue.Enqueue(txt_money);

        var text = "$" + damage.GetNumberAroundString();
        txt_money.text = text;
        txt_money.transform.GetChild(0).GetComponent<Text>().text = text;

        txt_money.transform.DOKill();
        txt_money.gameObject.SetActive(true);
        txt_money.transform.localScale = Vector3.zero;
        txt_money.transform.DOScale(0.015f, 0.5f).SetEase(Ease.Linear);
        txt_money.rectTransform.anchoredPosition = new Vector2(0, 0);

    }

    public void Dead()
    {
        dead = true;
        if (!win)
        {
            anim?.Play(die.name);
        }

        SoundControl.instance.PlayShot(SoundControl.instance.animal_dies[0]);

        hp_fill.transform.parent.gameObject.SetActive(false);
        DOVirtual.DelayedCall(die.length - 0.6f,
            () =>
            {
                if (anim)
                {
                    anim.enabled = false;
                }
            });
        body.DOKill();
        LevelControl.instance.RemoveEnemy(this, true);
        ondead?.Invoke();
        rip.SetActive(true);
    }

    Ally AllyGetAllyNearest()
    {
        float mindis = 100000;
        Ally allyNearest = null;
        for (int i = 0; i < LevelControl.instance.allies.Count; i++)
        {
            var ally = LevelControl.instance.allies[i];
            if (!ally.dead)
            {
                var dis = Vector3.Distance(ally.transform.position, transform.position);
                if (dis < mindis)
                {
                    mindis = dis;
                    allyNearest = ally;
                }
            }
        }

        return allyNearest;
    }

    private void Update()
    {
        if (!start_attack || attacking || dead)
        {
            return;
        }

        if (animalType == animal_type.animal)
        {
            float mindis = 100000;
            ally_move_to = AllyGetAllyNearest();

            if (ally_move_to != null)
            {
                anim?.Play(walk.name);
                var direct = ally_move_to.transform.position - transform.position;
                var angle = Mathf.Atan2(direct.x, direct.z) * Mathf.Rad2Deg;
                body.eulerAngles = new Vector3(0, angle, 0);
                transform.position = Vector3.MoveTowards(transform.position, ally_move_to.transform.position,
                    move_speed * Time.deltaTime);
            }
        }
    }

    private IEnumerator ieAttacking;
    private Vector3 atk_pos;

    private void OnCollisionStay(Collision other)
    {
        if (!dead)
        {
            if (animalType == animal_type.animal)
            {
                if (!attacking && other.transform.CompareTag("ally"))
                {
                    attacking = true;
                    ally_attack_to = other.transform.GetComponent<Ally>();
                    // rig.constraints = RigidbodyConstraints.FreezeAll;
                    StartCoroutine(ieAttacking = IEAttack(ally_attack_to));
                    atk_pos = other.GetContact(0).point;
                }
            }
        }
    }

    public void TakeDamageByArrow(int damage, Vector3 pos)
    {
        TakeDamage(damage, true);
        var atk_par = atk_par_queue.Dequeue();
        atk_par_queue.Enqueue(atk_par);
        atk_par.transform.position = pos;
        // atk_par.Clear();
        atk_par.Play();
    }

    private void OnCollisionExit(Collision other)
    {
        if (animalType == animal_type.animal)
        {
            if (!dead && other.transform.CompareTag("ally"))
            {
                if (ally_attack_to == other.transform.GetComponent<Ally>())
                {
                    ally_attack_to = null;
                    // rig.constraints = init_constraint;
                    attacking = false;
                    if (ieAttacking != null)
                    {
                        StopCoroutine(ieAttacking);
                    }
                }
            }
        }
    }

    IEnumerator IEAttack(Ally ally)
    {
        float atk_dur = 0;
        AnimationClip attack = null;
        if (animalType == animal_type.animal)
        {
            attack = attacks[Random.Range(0, attacks.Length)];
            atk_dur = attack.length;
        }
        else
        {
            atk_dur = 0.1f;
        }

        while (true)
        {
            float dur = attack_dur - atk_dur;
            while (dur > 0)
            {
                if (ally == null || ally.dead)
                {
                    break;
                }

                dur -= Time.deltaTime;
                yield return null;
            }

            if (ally.dead || dead)
            {
                ally = null;
                // if (LevelControl.instance.allies.Count == 0)
                // {
                //     rig.constraints = RigidbodyConstraints.FreezeAll;
                // }
                // else
                // {
                //     rig.constraints = init_constraint;
                // }
                attacking = false;
                yield break;
            }

            var direct = ally.transform.position - transform.position;
            var angle = Mathf.Atan2(direct.x, direct.z) * Mathf.Rad2Deg;
            body.eulerAngles = new Vector3(0, angle, 0);

            if (animalType == animal_type.animal)
            {
                attack = attacks[Random.Range(0, attacks.Length)];
                anim?.Play(attack.name);
            }

            ally.TakeDamage(damage, false);
            if (animalType == animal_type.animal)
            {
                SoundControl.instance.PlayShot(SoundControl.instance.fireball);
            }

            yield return new WaitForSeconds(atk_dur);
        }
    }
}
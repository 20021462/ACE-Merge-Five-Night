using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;
using UnityEngine.UI;
using Random = UnityEngine.Random;

public enum animal_type
{
    animal,
    human
}

public enum evolution
{
    e1,
    e2,
    e3,
    e4,
    e5,
    e6,
    e7,
    e8,
    e9,
    e10,
    e11,
    e12,
    e13,
    e14,
    e15
}

public class Ally : MonoBehaviour
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
    public float move_speed;
    public Transform body;
    public Image hp_fill;
    public Text txt_money;
    private float throw_speed = 15;
    public Transform throw_position;
    public Arrow[] throw_objects;
    private Queue<Arrow> throw_objects_queue;
    public Animator anim;
    public AnimationClip idle, walk, die, victory, fly_up, flying, fly_down;
    public AnimationClip[] attacks;
    public ParticleSystem[] atk_pars;
    private Queue<ParticleSystem> atk_par_queue;
    public List<GameObject> combat_fxs;

    public static Ally current;
    public bool dead;
    private bool start_attack;
    private bool attacking;
    private bool win;

    [Header("runtime")] public Transform grid;
    public Enemy enemy_attack_to;
    public Enemy enemy_move_to;
    private float anim_speed = 1.5f;
    public Action<Transform> on_mele_attack_target;
    public Action ondead;


    public void SetData((int hp, int damage, float attack_dur, float move_speed) data, bool is_merge)
    {
        if (!is_merge)
        {
            var scale = body.localScale;
            body.localScale = scale * 0.2f;
            body.DOScale(scale, 0.5f);
        }

        this.hp = data.hp;
        this.damage = data.damage;
        this.attack_dur = data.attack_dur;
        this.move_speed = data.move_speed;
        hp_fill.fillAmount = 1;
    }


    IEnumerator Start()
    {
        throw_objects_queue = new Queue<Arrow>(throw_objects);
        atk_par_queue = new Queue<ParticleSystem>(atk_pars);
        if (!start_attack)
        {
            var colliders = GetComponents<Collider>();
            colliders[0].enabled = true;
            colliders[1].enabled = false;
        }

        yield return null;
        LevelControl.instance.AddAlly(this);
        if (is_layer_animator2)
        {
            anim.SetLayerWeight(1, 1);
        }
        if (anim)
        {
            anim.speed = anim_speed;
        }

        anim.Play(fly_down.name);
    }

    public void Spawn(Transform grid)
    {
        this.grid = grid;
        transform.position = grid.position;
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
        start_attack = true;
        dead = false;
        curhp = hp;
        var colliders = GetComponents<Collider>();
        colliders[0].enabled = false;
        colliders[1].enabled = true;
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
        Enemy enemyTarget = getNearestEnemy();
        while (true)
        {
            refind: ;
            float dur = attack_dur - delay;
            if (is_long_hand)
            {
                dur -= 0.5f;
            }

            while (dur > 0)
            {
                if (enemyTarget == null)
                {
                    yield break;
                }
                else if (enemyTarget.dead)
                {
                    enemyTarget = getNearestEnemy();
                    goto refind;
                }

                dur -= Time.deltaTime;
                var direct = enemyTarget.transform.position - transform.position;
                var angle = Mathf.Atan2(direct.x, direct.z) * Mathf.Rad2Deg;
                body.eulerAngles = new Vector3(0, angle, 0);
                yield return null;
            }

            if (dead || LevelControl.instance.enemies.Count == 0)
            {
                attacking = false;
                yield break;
            }

            if (enemyTarget != null && !enemyTarget.dead)
            {
                var attack = attacks[Random.Range(0, attacks.Length)];
                anim?.Play(attack.name);
                yield return new WaitForSeconds(delay);
                if (dead || LevelControl.instance.enemies.Count == 0)
                {
                    attacking = false;
                    yield break;
                }

                if (is_long_hand)
                {
                    SoundControl.instance.PlayShot(SoundControl.instance.grab_back);
                }
                else SoundControl.instance.PlayShot(SoundControl.instance.bowing);

                if (!is_long_hand)
                {
                    var obj = throw_objects_queue.Dequeue();
                    throw_objects_queue.Enqueue(obj);
                    obj.SetMove(true, throw_position.position, enemyTarget.transform.position, damage, throw_speed);
                }
                else
                {
                    on_mele_attack_target?.Invoke(enemyTarget.transform);
                    DOVirtual.DelayedCall(0.2f, () => enemyTarget.TakeDamage(damage, false));
                    yield return new WaitForSeconds(0.7f);
                }

                var direct = enemyTarget.transform.position - transform.position;
                var angle = Mathf.Atan2(direct.x, direct.z) * Mathf.Rad2Deg;
                body.eulerAngles = new Vector3(0, angle, 0);
            }
        }
    }

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
        LevelControl.instance.UpdateAllyHp(damage);
        var ratio = Mathf.Clamp01((float) curhp / (float) hp);
        DOTween.To(() => hp_fill.fillAmount, value => hp_fill.fillAmount = value, ratio, 0.2f);
        if (byArrow)
        {
            SoundControl.instance.PlayShot(SoundControl.instance.takedamage_bowing);
        }
        else SoundControl.instance.PlayShot(SoundControl.instance.takedamage);

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

    public void Dead()
    {
        dead = true;
        if (!win)
        {
            anim?.Play(die.name);
        }

        LevelControl.instance.RemoveAlly(this, true);
        SoundControl.instance.PlayShot(SoundControl.instance.animal_dies[0]);

        hp_fill.transform.parent.gameObject.SetActive(false);
        body.DOKill();
        DOVirtual.DelayedCall(die.length, () =>
        {
            if (anim)
            {
                anim.enabled = false;
            }
        });
        ondead?.Invoke();
        rip.SetActive(true);
    }

    private void OnMouseDown()
    {
        if (Utils.IsPointerOverUIElement())
        {
            //Debug.Log("mousedown UI");
            return;
        }

        if (start_attack)
        {
            return;
        }

        if (current != null)
        {
            current.transform.position = grid.transform.position;
        }

        current = this;
        anim.Play(fly_up.name);
        SoundControl.instance.PlayShot(SoundControl.instance.click);
        if (UIController.instace.deleting.activeInHierarchy)
        {
            UIController.instace.DeletePopup.Show(this);
        }
        //Debug.Log(transform.name, transform);
    }

    public void PlayAnimFlyDown()
    {
        anim.Play(fly_down.name);
    }

    Enemy getNearestEnemy()
    {
        float mindis = 100000;
        Enemy enemyTarget = null;
        for (int i = 0; i < LevelControl.instance.enemies.Count; i++)
        {
            var enemy = LevelControl.instance.enemies[i];
            if (!enemy.dead)
            {
                var dis = Vector3.Distance(enemy.transform.position, transform.position);
                if (dis < mindis)
                {
                    mindis = dis;
                    enemyTarget = enemy;
                }
            }
        }

        return enemyTarget;
    }

    private void Update()
    {
        if (!start_attack || attacking || dead)
        {
            return;
        }

        if (animalType == animal_type.animal)
        {
            enemy_move_to = getNearestEnemy();

            if (enemy_move_to != null)
            {
                anim?.Play(walk.name);
                var direct = enemy_move_to.transform.position - transform.position;
                var angle = Mathf.Atan2(direct.x, direct.z) * Mathf.Rad2Deg;
                body.eulerAngles = new Vector3(0, angle, 0);
                transform.position = Vector3.MoveTowards(transform.position, enemy_move_to.transform.position,
                    move_speed * Time.deltaTime);
            }
        }
    }

    private IEnumerator ieAttacking;
    private Vector3 atk_pos;

    private void OnCollisionStay(Collision other)
    {
        if (animalType == animal_type.animal)
        {
            if (!dead && !attacking && other.transform.CompareTag("enemy"))
            {
                attacking = true;
                enemy_attack_to = other.transform.GetComponent<Enemy>();
                // rig.constraints = RigidbodyConstraints.FreezeAll;
                StartCoroutine(ieAttacking = IENearAttack(enemy_attack_to));
                atk_pos = other.GetContact(0).point;
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
            if (!dead && other.transform.CompareTag("enemy"))
            {
                if (enemy_attack_to == other.transform.GetComponent<Enemy>())
                {
                    enemy_attack_to = null;
                    attacking = false;
                    if (ieAttacking != null)
                    {
                        StopCoroutine(ieAttacking);
                    }
                }
            }
        }
    }

    IEnumerator IENearAttack(Enemy enemy)
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
                if (enemy == null || enemy.dead)
                {
                    break;
                }

                dur -= Time.deltaTime;
                yield return null;
            }

            if (enemy.dead || dead)
            {
                enemy = null;

                // if (LevelControl.instance.enemies.Count == 0)
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

            var direct = enemy.transform.position - transform.position;
            var angle = Mathf.Atan2(direct.x, direct.z) * Mathf.Rad2Deg;
            body.eulerAngles = new Vector3(0, angle, 0);
            if (animalType == animal_type.animal)
            {
                attack = attacks[Random.Range(0, attacks.Length)];
                anim?.Play(attack.name);
            }

            enemy.TakeDamage(damage, false);
            if (animalType == animal_type.animal)
            {
                SoundControl.instance.PlayShot(SoundControl.instance.fireball);
            }

            yield return new WaitForSeconds(atk_dur);
        }
    }
}
using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;

public class SoundControl : MonoBehaviour
{
    public static SoundControl instance;
    public AudioSource bg_source;

    // public AudioSource music_source;
    public AudioSource[] sound_sources;
    private Queue<AudioSource> queue_sources;

    public AudioClip click, spawn, fireball, takedamage, takedamage_bowing, bowing, merge, drop, collect_coin, lose, win, coin, newlevel, reward_click,
        enemy_spawn, machine_destroy, grab_back, warning_lose;

    public AudioClip[] animal_dies, human_dies;
    private void Awake()
    {
        if (instance != null)
        {
            Destroy(gameObject);
            return;
        }
        else
        {
            instance = this;
            queue_sources = new Queue<AudioSource>(sound_sources);
        }

        if (!WinPopup.isWin)
        {
            DOVirtual.DelayedCall(1, () => { PlayShot(warning_lose);});
        }
    }

    public void ChangeSoundVolume()
    {
    }

    public void ChangeMusicVolume()
    {
        // music_source.mute = UIController.instace.music == 0;
    }

    public void PlayShot(AudioClip clip, float volume = 1)
    {
        if (UIController.instace.sound == 0)
        {
            return;
        }
        var source = queue_sources.Dequeue();
        source.volume = volume;
        source.PlayOneShot(clip);
        queue_sources.Enqueue(source);
    }
}
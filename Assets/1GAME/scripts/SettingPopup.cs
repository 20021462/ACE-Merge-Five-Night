using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SettingPopup : Popup
{
    public Transform sound, music, vibrate;
    //public GameObject btn_restore_purchase;

    private void OnEnable()
    {
        SoundControl.instance.PlayShot(SoundControl.instance.click);
        AdsAdapter.instance.ShowBanner();
        var soundEnable = UIController.instace.sound == 1;
        var musicEnable = UIController.instace.music == 1;
        var vibrateEnable = UIController.instace.vibrate == 1;
        sound.GetChild(0).gameObject.SetActive(soundEnable);
        sound.GetChild(1).gameObject.SetActive(!soundEnable);
        music.GetChild(0).gameObject.SetActive(musicEnable);
        music.GetChild(1).gameObject.SetActive(!musicEnable);
        vibrate.GetChild(0).gameObject.SetActive(vibrateEnable);
        vibrate.GetChild(1).gameObject.SetActive(!vibrateEnable);

// #if UNITY_ANDROID
//         btn_restore_purchase.SetActive(false);
// #elif UNITY_IPHONE
//         btn_restore_purchase.SetActive(true);
// #endif
    }

    private void OnDisable()
    {
    }

    public void Sound()
    {
        if (UIController.instace.sound == 1)
        {
            UIController.instace.sound = 0;
        }
        else
        {
            UIController.instace.sound = 1;
        }

        var soundEnable = UIController.instace.sound == 1;
        //Debug.LogError(soundEnable);
        sound.GetChild(0).gameObject.SetActive(soundEnable);
        sound.GetChild(1).gameObject.SetActive(!soundEnable);

        SoundControl.instance.ChangeSoundVolume();
        SoundControl.instance.PlayShot(SoundControl.instance.click);
    }

    public void Music()
    {
        if (UIController.instace.music == 1)
        {
            UIController.instace.music = 0;
        }
        else
        {
            UIController.instace.music = 1;
        }

        var musicEnable = UIController.instace.music == 1;
        //Debug.LogError(musicEnable);
        music.GetChild(0).gameObject.SetActive(musicEnable);
        music.GetChild(1).gameObject.SetActive(!musicEnable);

        SoundControl.instance.ChangeMusicVolume();
        SoundControl.instance.PlayShot(SoundControl.instance.click);
    }

    public void Vibrate()
    {
        // if (UIController.instace.vibrate == 1)
        // {
        //     UIController.instace.vibrate = 0;
        // }
        // else
        // {
        //     UIController.instace.vibrate = 1;
        // }
        // var vibrateEnable = UIController.instace.vibrate == 1;
        // //Debug.LogError(vibrateEnable);
        // vibrate.GetChild(0).gameObject.SetActive(vibrateEnable);
        // vibrate.GetChild(1).gameObject.SetActive(!vibrateEnable);
        // SoundControl.instance.PlayShot(SoundControl.instance.click);
    }
}
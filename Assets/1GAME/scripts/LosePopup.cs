using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;
using UnityEngine.SceneManagement;

public class LosePopup : Popup
{
    public void Retry()
    {
        SoundControl.instance.PlayShot(SoundControl.instance.click);
        AdsAdapter.instance.ShowInterstitial();
        DOVirtual.DelayedCall(0.1f, () => { SceneManager.LoadScene(0); });
    }

    private void OnDisable()
    {
    }
}

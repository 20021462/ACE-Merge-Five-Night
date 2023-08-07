using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ShopItem : MonoBehaviour
{
    public Text txt_xcoin;
    public Text txt_coin_earn;
    public string x1_earn, x2_earn, x3_earn;

    private void OnEnable()
    {
        if (txt_coin_earn == null)
        {
            return;
        }
        var x = 1;
        if (x == 1)
        {
            txt_xcoin.gameObject.SetActive(false);
        }
        else
        {
            txt_xcoin.gameObject.SetActive(true);
            txt_xcoin.text = "x" + x;
        }

        if (x == 1)
        {
            txt_coin_earn.text = x1_earn;
        }
        else if (x == 2)
        {
            txt_coin_earn.text = x2_earn;
        }
        else if (x == 3)
        {
            txt_coin_earn.text = x3_earn;
        }
    }
}

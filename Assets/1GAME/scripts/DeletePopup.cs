using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DeletePopup : Popup
{
    public Sprite[] animals, humans;
    public Image img_icon;
    private Ally ally;

    public override void Show(object data)
    {
        base.Show(data);
        ally = (Ally)data;
        if (ally == null)
        {
            Hide();
        }
        if (ally.animalType == animal_type.animal)
        {
            img_icon.sprite = animals[(int)ally.evolution];
        }
        else
        {
            img_icon.sprite = humans[(int)ally.evolution];
        }
        img_icon.SetNativeSize();
    }

    public void Confirm()
    {
        LevelControl.instance.RemoveAlly(ally);
        Hide();
        UIController.instace.ValidateBtnDelete();
    }

    public override void Hide()
    {
        base.Hide();
        UIController.instace.HideDeleteAction();
    }
}

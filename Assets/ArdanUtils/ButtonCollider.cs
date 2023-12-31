using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class ButtonCollider : MonoBehaviour
{
    public UnityEvent onClick;

    private void OnMouseDown()
    {
        if (Utils.IsPointerOverUIElement())
            return;
        onClick?.Invoke();
    }
}
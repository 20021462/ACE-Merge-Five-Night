using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NewMapPopup : Popup
{
    public static int map_index;
    public List<GameObject> maps;
    public override void Show(object data)
    {
        base.Show(data);
        var index = (int)data;
        map_index = index;
        maps[index].SetActive(true);
    }
}

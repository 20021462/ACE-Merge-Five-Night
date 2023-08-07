using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class GridSelection : MonoBehaviour
{
    private Camera cam;
    private int grid_layer, ground_layer;
    public GameObject grid_obj, reward;
    public SpriteRenderer[] grid_sprites;
    [HideInInspector] public Transform[] grids;
    public static Transform current_grid;
    private int UILayer;

    private void Awake()
    {
        cam = Camera.main;
        grid_layer = 1 << LayerMask.NameToLayer("grid");
        ground_layer = 1 << LayerMask.NameToLayer("ground");
        grids = new Transform[grid_sprites.Length];
        for (int i = 0; i < grid_sprites.Length; i++)
        {
            grids[i] = grid_sprites[i].transform;
        }

        UILayer = 1 << LayerMask.NameToLayer("UI");
        reward.SetActive(!WinPopup.isWin && UIController.instace.level_unlock >= 5);
    }

    void Update()
    {
        if (Utils.IsPointerOverUIElement())
        {
            return;
        }
        if (Input.GetMouseButton(0) && (LevelControl.instance.cur_level > 1 || LevelControl.instance.cur_level == 1 && LevelControl.instance.allies.Count > 1))
        {
            var ray = cam.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;
            if (Ally.current != null && Physics.Raycast(ray, out hit, 100, ground_layer))
            {
                if (hit.collider)
                {
                    Ally.current.transform.position = hit.point;
                }
            }
            if (Physics.Raycast(ray, out hit, 100, grid_layer))
            {
                if (hit.collider)
                {
                    foreach (var sprite in grid_sprites)
                    {
                        sprite.enabled = false;
                    }
                    hit.transform.GetComponent<SpriteRenderer>().enabled = true;
                    if (current_grid != hit.transform)
                    {
                        current_grid = hit.transform;
                        Vibration.Vibrate(100);
                    }
                }
            }
            else
            {
                UnSelectGrid();
            }
        }
        else if(Input.GetMouseButtonUp(0))
        {
            if (Ally.current != null)
            {
                if (current_grid != null)
                {
                    bool same_grid = false;
                    foreach (var ally in LevelControl.instance.allies)
                    {
                        if (ally.grid == current_grid)
                        {
                            same_grid = true;
                        }

                        if (Ally.current != ally && Ally.current.animalType == ally.animalType 
                                                 && ally.grid == current_grid && ally.evolution != evolution.e15)
                        {
                            if (ally.evolution != Ally.current.evolution)
                            {
                                SetAllyToGrid(Ally.current, Ally.current.grid);
                            }
                            else
                            {
                                LevelControl.instance.Merge(ally, Ally.current, ally.animalType);
                                break;
                            }
                        }
                        else
                        {
                            SetAllyToGrid(Ally.current, Ally.current.grid);
                        }
                    }

                    if (!same_grid)
                    {
                        if (UIController.instace.level_unlock + 1 == 1 
                            && LevelControl.instance.allies.Count == 2)
                        {
                            if (Array.IndexOf(grids, current_grid) == 12)
                            {
                                SetAllyToGrid(Ally.current, current_grid);
                            }
                        }
                        else SetAllyToGrid(Ally.current, current_grid);
                    }
                }
                else
                {
                    SetAllyToGrid(Ally.current, Ally.current.grid);
                }

                Ally.current.PlayAnimFlyDown();
                Ally.current = null;
            }
            UnSelectGrid();
        }
    }


    void SetAllyToGrid(Ally ally, Transform grid)
    {
        if (ally.grid != grid)
        {
            LevelControl.instance.MoveAllyToNewGrid(ally.grid, grid);
        }
        ally.transform.position = grid.position;
        ally.grid = grid;
        SoundControl.instance.PlayShot(SoundControl.instance.drop, 0.06f);
    }
    void UnSelectGrid()
    {
        foreach (var sprite in grid_sprites)
        {
            sprite.enabled = false;
        }
        current_grid = null; 
    }

    public void StartFight()
    {
        grid_obj.SetActive(false);
    }
    
}

﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MenuControls : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
    public void StartButton()
    {
        Application.LoadLevel("GamePlay");
    }
    public void OptionsButton()
    {
        Application.LoadLevel("Options");
    }
    public void ExitButton()
    {
        Application.Quit();
    }
}

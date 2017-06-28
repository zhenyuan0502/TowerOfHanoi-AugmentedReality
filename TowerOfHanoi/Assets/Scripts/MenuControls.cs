using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MenuControls : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
    public void StartButton()
    {
		SceneManager.LoadScene ("GamePlay");
    }
    public void OptionsButton()
    {
		SceneManager.LoadScene ("Options");
    }
    public void ExitButton()
    {
        Application.Quit();
    }
}

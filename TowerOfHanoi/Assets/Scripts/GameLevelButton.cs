using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameLevelButton : MonoBehaviour {
	
	public int levelNr = 0;
	public bool isManualPlay = false;

	public void StartLevel()
	{
		GameLevel.currentLevel = levelNr;
		GameLevel.isManualPlay = isManualPlay;
		SceneManager.LoadScene ("GamePlay");
	}
}

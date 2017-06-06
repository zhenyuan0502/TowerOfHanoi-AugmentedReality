using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameLevelButton : MonoBehaviour {
	
	public int levelNr = 3;

	public void StartLevel()
	{
		GameLevel.currentLevel = levelNr;
		SceneManager.LoadScene ("GamePlay");
	}
}

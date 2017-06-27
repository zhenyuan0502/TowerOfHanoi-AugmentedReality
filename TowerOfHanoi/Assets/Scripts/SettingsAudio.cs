using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SettingsAudio : MonoBehaviour {
	
	public void MasterVolumne_SliderChanged(float SliderValue)
	{
		AudioListener.volume = SliderValue;
	}

	public void MusicVolumne_SliderChanged(float SliderValue)
	{
		AudioManager.soundSFX = SliderValue;

	}
}

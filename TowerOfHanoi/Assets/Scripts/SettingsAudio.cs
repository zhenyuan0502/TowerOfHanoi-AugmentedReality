using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SettingsAudio : MonoBehaviour {
	
	public void MasterVolume_SliderChanged(float SliderValue)
	{
		AudioListener.volume = SliderValue;
	}

	public void MusicVolume_SliderChanged(float SliderValue)
	{
		AudioManager.soundMusic = SliderValue;

	}
	public void SFXVolume_SliderChanged(float SliderValue)
	{
		AudioManager.soundSFX = SliderValue;
	}
}

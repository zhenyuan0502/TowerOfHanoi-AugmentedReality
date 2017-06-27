using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(AudioSource))]
public class AudioSFX : MonoBehaviour {
	AudioSource audioSource = new AudioSource();
	// Use this for initialization
	void Start () {
		audioSource.volume = AudioManager.soundSFX;
	}
}

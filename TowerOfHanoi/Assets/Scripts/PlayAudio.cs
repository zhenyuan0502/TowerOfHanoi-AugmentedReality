using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayAudio : MonoBehaviour {

	AudioSource audioSource;
	// Use this for initialization
	void Start () {
		audioSource = GameObject.FindObjectOfType<AudioSource> ();
		audioSource.volume = AudioManager.soundSFX;
	}

	public void PlayAudioWith(AudioClip audioClip){
		Start ();
		audioSource.PlayOneShot (audioClip);
	}
}

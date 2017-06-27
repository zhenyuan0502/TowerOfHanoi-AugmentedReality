using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AutoPlayAudio : MonoBehaviour {

	public AudioSource audioSource;
	public AudioClip audioClip;
	// Use this for initialization

	public AutoPlayAudio(){
		audioSource = GameObject.FindObjectOfType<AudioSource> ();
		audioSource.volume = AudioManager.soundSFX;
		//		audioSource.PlayOneShot (audioSource.clip);
	}

	public void PlayAudio(){
		audioSource.PlayOneShot (audioSource.clip);

	}
}

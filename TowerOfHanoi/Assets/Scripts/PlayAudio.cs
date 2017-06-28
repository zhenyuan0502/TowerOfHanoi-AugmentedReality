using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayAudio : MonoBehaviour {
	// Âm thanh khi nhấn nút
	public AudioSource audioSource;
//	// Use this for initialization
//	void Start () {
//		audioSource = GameObject.FindObjectOfType<AudioSource> ();
//	}

	public void PlayButtonAudio(){
//		Start ();
		audioSource.volume = AudioManager.soundSFX;
		audioSource.PlayOneShot (audioSource.clip);
	}

//	void Update(){
//		audioSource.volume = AudioManager.soundSFX;
//	}
}

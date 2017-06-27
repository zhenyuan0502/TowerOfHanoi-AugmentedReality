using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayBackgroundAudio : MonoBehaviour {

	public AudioSource audioSource;
	// Use this for initialization
	void Start () {
		audioSource = GameObject.FindObjectOfType<AudioSource> ();
		audioSource.volume = AudioManager.soundMusic;
		audioSource.playOnAwake = true;
		audioSource.loop = true;
		audioSource.Play ();
	}

	void Update(){
		audioSource.volume = AudioManager.soundMusic;
	}
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayBackgroundAudio : MonoBehaviour {
	// Âm thanh nhạc nền
	public AudioSource audioSource;
	// Use this for initialization
	void Start () {
		DontDestroyOnLoad(audioSource);
		audioSource = GameObject.Find("BackgroundAudio").GetComponent<AudioSource>();
		audioSource.volume = AudioManager.soundMusic;
		audioSource.playOnAwake = true;
		audioSource.loop = true;
		audioSource.Play ();
	}

	void Update(){
		audioSource.volume = AudioManager.soundMusic;
	}

}

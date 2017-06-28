using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayAudio : MonoBehaviour {
	// Âm thanh khi nhấn nút
	public AudioSource audioSource;
	public void PlayButtonAudio(){
		audioSource.volume = AudioManager.soundSFX;
		audioSource.PlayOneShot (audioSource.clip);
	}
}

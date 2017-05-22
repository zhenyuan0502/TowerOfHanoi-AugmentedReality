using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Vuforia;

public class Gravity : MonoBehaviour {
	// Use this for initialization
	public float defaultZ = 0;
	public float defaultX = 0;
	public float defaultY = 0;
	BoxCollider box;

	void Start () {
		transform.position = new Vector3(0, transform.position.y, transform.position.z);
		defaultZ = transform.position.z;
		defaultX = transform.position.x;
		defaultY = transform.position.y;
		box = new BoxCollider ();
		box.enabled = true;
	}
	
	// Update is called once per frame
	void Update () {
//		if (transform.position.y < 0) {
//			transform.position = new Vector3 (defaultX, defaultY, defaultZ);
//		} else {
//			transform.position = new Vector3 (transform.position.x, transform.position.y, defaultZ);
//			defaultX = transform.position.x;
//			defaultY = transform.position.y;
//			defaultZ = transform.position.z;
//		}
		transform.position = new Vector3 (defaultX, defaultY, defaultZ);
	}


}

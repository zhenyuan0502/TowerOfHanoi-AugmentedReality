using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Gravity : MonoBehaviour {
	// Use this for initialization
	void Start () {
		transform.position = new Vector3(0, 0, 0.2);
	}
	
	// Update is called once per frame
	void Update () {

		if (trans.position.y > 0) {

		} else {
			trans.position.y = 0;
		}
	}
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Vuforia;

public class virBtnScript : MonoBehaviour, IVirtualButtonEventHandler {
	private GameObject vb_TowerB;
	private GameObject torus_1;
	private GameObject Tower_C;
	float pTowerC = 0;

	// Use this for initialization
	void Start () {
		vb_TowerB = GameObject.Find ("btn_TowerB");
		torus_1 = GameObject.Find ("Torus (1)");

		Tower_C = GameObject.Find ("TowerC");
		pTowerC = Tower_C.transform.position.x;

		vb_TowerB.GetComponent<VirtualButtonBehaviour> ().RegisterEventHandler (this);
	}

	public void OnButtonPressed(VirtualButtonAbstractBehaviour vButton ){
		torus_1.transform.position = new Vector3 (pTowerC, transform.position.y, 0);
		Debug.Log ("On B Press");
	}

	public void OnButtonReleased(VirtualButtonAbstractBehaviour vButton ){
		torus_1.transform.position = new Vector3 (pTowerC, transform.position.y, 0);
		Debug.Log ("On B Release");

	}

	// Update is called once per frame
	void Update () {
		
	}
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Vuforia;

public class virBtnScript : MonoBehaviour, IVirtualButtonEventHandler {
	private GameObject vb_TowerB;

	// Use this for initialization
	void Start () {
		vb_TowerB = GameObject.Find ("btn_TowerB");
		vb_TowerB.GetComponent<VirtualButtonBehaviour> ().RegisterEventHandler (this);
	}

	public void OnButtonPressed(VirtualButtonAbstractBehaviour vButton ){

	}

	public void OnButtonReleased(VirtualButtonAbstractBehaviour vButton ){

	}

	// Update is called once per frame
	void Update () {
		
	}
}

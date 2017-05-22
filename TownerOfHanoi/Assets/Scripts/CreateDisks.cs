using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CreateDisks : MonoBehaviour {

    public GameObject Disk = GameObject.CreatePrimitive(PrimitiveType.Cylinder);

	// Use this for initialization
	void Start () {
        for (int i = 0; i <= 7; i++)
        {
            Instantiate(Disk);
            Disk.transform.localScale = new Vector3(0.25f - 0.03f * i, 0.1f, 0.25f - 0.03f * i);
            Disk.transform.position = new Vector3(-0.3f, 0.1f * i, 0f);
        }

	}
	
	// Update is called once per frame
	void Update () {
		
	}
}

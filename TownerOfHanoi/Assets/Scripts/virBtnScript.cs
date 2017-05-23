using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Vuforia;

public class virBtnScript : MonoBehaviour, IVirtualButtonEventHandler {
	private GameObject btn_towerA;
	private GameObject btn_towerB;
	private GameObject btn_towerC;

	private GameObject TowerA;
	private GameObject TowerB;
	private GameObject TowerC;

	float pTowerC = 0;
	float pTowerB = 0;
	float pTowerA = 0;

	float[] positionY_of_level;

	Stack<GameObject> stkTowerA;
	Stack<GameObject> stkTowerB;
	Stack<GameObject> stkTowerC;

	private GameObject[] torus;

	public float defaultZ = 0;
	public float defaultX = 0;
	public float defaultY = 0;

	bool hold = false;

	int flag = 1;
	// Use this for initialization
	void Start () {
		// Khởi tạo vị trí tọa độ Y của torus, tọa độ Y này sẽ không thay đổi
		positionY_of_level = new float[9];


		// Lưu ý: POP luôn là trên cùng
		// Khởi tạo stack Tower A
		stkTowerA = new Stack<GameObject>();

		// Khởi tạo stack Tower B
		stkTowerB = new Stack<GameObject>();

		// Khởi tạo stack Tower C
		stkTowerC = new Stack<GameObject>();

		// Lấy torus đồng thời đổ vào list tower A
		torus = new GameObject[9];
		for (int i = 1; i <= 8; i++) {
			torus [i] = GameObject.Find ("Torus ("+i+")");
			positionY_of_level [i] = torus [i].transform.position.y;
		}

//		positionY_of_level 1: -
//		positionY_of_level 2: --
//		positionY_of_level 3: ---
//		positionY_of_level 4: ----
//		positionY_of_level 5: -----
//		positionY_of_level 6: ------
//		positionY_of_level 7: -------
//		positionY_of_level 8: --------


		for (int i = 8; i >= 1; i--) {
			// Đổ vào list A
			stkTowerA.Push(torus[i]);
		}

		// Lấy button của Tower
		btn_towerA = GameObject.Find ("btn_towerA");
		btn_towerB = GameObject.Find ("btn_towerB");
		btn_towerC = GameObject.Find ("btn_towerC");

		// Lấy Tower
		TowerC = GameObject.Find ("TowerC");
		TowerB = GameObject.Find ("TowerB");
		TowerA = GameObject.Find ("TowerA");


		// Lấy Z mặc định (của cột)
		defaultZ = TowerA.transform.position.z;

		// Lấy vị trí của các cột
		pTowerC = TowerC.transform.position.x;
		pTowerB = TowerB.transform.position.x;
		pTowerA = TowerA.transform.position.x;

		btn_towerA.GetComponent<VirtualButtonBehaviour> ().RegisterEventHandler (this);
		btn_towerB.GetComponent<VirtualButtonBehaviour> ().RegisterEventHandler (this);
		btn_towerC.GetComponent<VirtualButtonBehaviour> ().RegisterEventHandler (this);
	}

	// Khi button được nhấn, chỉ thay đổi X và Y, không thay đổi Z

	public void OnButtonPressed(VirtualButtonAbstractBehaviour vButton ){
//		torus_1.transform.position = new Vector3 (pTowerC, transform.position.y, 0);
		switch (vButton.VirtualButtonName) {
		case "btn_towerA":
			Debug.Log ("On A Press");
			if (hold) {
				switch (flag) {
				case 2:
					GameObject temp_1 = stkTowerB.Peek ();

					stkTowerB.Pop ();
					stkTowerA.Push (temp_1);
					break;
				case 3:
					GameObject temp_2 = stkTowerC.Peek ();

					stkTowerC.Pop ();
					stkTowerA.Push (temp_2);
					break;
				}
				hold = false;
			} else {
				flag = 1;
				hold = true;
			}
			break;
		case "btn_towerB": 
			Debug.Log ("On B Press");
			if (hold) {
				switch (flag) {
				case 1:
					GameObject temp_1 = stkTowerA.Peek ();

					stkTowerA.Pop ();
					stkTowerB.Push (temp_1);
					break;
				case 3:
					GameObject temp_2 = stkTowerC.Peek ();

					stkTowerC.Pop ();
					stkTowerB.Push (temp_2);
					break;
				}
				hold = false;
			} else {
				flag = 2;
				hold = true;
			}
			break;
		case "btn_towerC": 
			Debug.Log ("On C Press");

			if (hold) {
				switch (flag) {
				case 1:
					GameObject temp_1 = stkTowerA.Peek ();

					stkTowerA.Pop ();
					stkTowerC.Push (temp_1);
					break;
				case 2:
					GameObject temp_2 = stkTowerB.Peek ();

					stkTowerB.Pop ();
					stkTowerC.Push (temp_2);
					break;
				}
			} else {
				flag = 3;
				hold = true;
			}
			break;
		}
	}

	public void OnButtonReleased(VirtualButtonAbstractBehaviour vButton ){
		switch (vButton.VirtualButtonName) {
		case "btn_towerA": 
			Debug.Log ("On A Release");
			break;
		case "btn_towerB": 
			Debug.Log ("On B Release");
			break;
		case "btn_towerC": 
			Debug.Log ("On C Release");
			break;
		}

	}

	// Update is called once per frame
	void Update () {
//		if (flag == 1) {
//			
////			torus [1].transform.position = new Vector3 (pTowerA, positionY_of_level [1], defaultZ);
////			torus [2].transform.position = new Vector3 (pTowerA, positionY_of_level [2], defaultZ);
////			torus [3].transform.position = new Vector3 (pTowerA, positionY_of_level [3], defaultZ);
////			torus [4].transform.position = new Vector3 (pTowerA, positionY_of_level [4], defaultZ);
////			torus [5].transform.position = new Vector3 (pTowerA, positionY_of_level [5], defaultZ);
////			torus [6].transform.position = new Vector3 (pTowerA, positionY_of_level [6], defaultZ);
////			torus [7].transform.position = new Vector3 (pTowerA, positionY_of_level [7], defaultZ);
////			torus [8].transform.position = new Vector3 (pTowerA, positionY_of_level [8], defaultZ);
//		} else if (flag == 2) {
//			
////			torus [1].transform.position = new Vector3 (pTowerB, positionY_of_level [1], defaultZ);
////			torus [2].transform.position = new Vector3 (pTowerB, positionY_of_level [2], defaultZ);
////			torus [3].transform.position = new Vector3 (pTowerB, positionY_of_level [3], defaultZ);
////			torus [4].transform.position = new Vector3 (pTowerB, positionY_of_level [4], defaultZ);
////			torus [5].transform.position = new Vector3 (pTowerB, positionY_of_level [5], defaultZ);
////			torus [6].transform.position = new Vector3 (pTowerB, positionY_of_level [6], defaultZ);
////			torus [7].transform.position = new Vector3 (pTowerB, positionY_of_level [7], defaultZ);
////			torus [8].transform.position = new Vector3 (pTowerB, positionY_of_level [8], defaultZ);
//		} else if (flag == 3) {
//			
////			torus [1].transform.position = new Vector3 (pTowerC, positionY_of_level [1], defaultZ);
////			torus [2].transform.position = new Vector3 (pTowerC, positionY_of_level [2], defaultZ);
////			torus [3].transform.position = new Vector3 (pTowerC, positionY_of_level [3], defaultZ);
////			torus [4].transform.position = new Vector3 (pTowerC, positionY_of_level [4], defaultZ);
////			torus [5].transform.position = new Vector3 (pTowerC, positionY_of_level [5], defaultZ);
////			torus [6].transform.position = new Vector3 (pTowerC, positionY_of_level [6], defaultZ);
////			torus [7].transform.position = new Vector3 (pTowerC, positionY_of_level [7], defaultZ);
////			torus [8].transform.position = new Vector3 (pTowerC, positionY_of_level [8], defaultZ);
//		}

//		int countA = stkTowerA.Count;
//		int element = 1;
//		// item lấy từ 1 -> hết stack
//		foreach(var item in stkTowerA){
//			item.transform.position = new Vector3 (pTowerA, positionY_of_level[8 - countA + element], defaultZ);
//			element++;
//		}

		print (stkTowerA, pTowerA, defaultZ, positionY_of_level);
		print (stkTowerB, pTowerB, defaultZ, positionY_of_level);
		print (stkTowerC, pTowerC, defaultZ, positionY_of_level);

	}

	public static void print (Stack<GameObject> stkTower, float pTower, float defaultZ, float[] positionY_of_level){
		int count = stkTower.Count;
		int element = 1;
		// item lấy từ 1 -> hết stack
		foreach(var item in stkTower){
			item.transform.position = new Vector3 (pTower, positionY_of_level[8 - count + element], defaultZ);
			element++;
		}
	}
}

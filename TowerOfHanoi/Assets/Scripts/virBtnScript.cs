using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Vuforia;
using UnityEngine.UI;

public class virBtnScript : MonoBehaviour, IVirtualButtonEventHandler
{
	// Sử dụng để gọi nhanh button ẩn - hiện (close - release)
	private static int BUTTON_A = 1;
	private static int BUTTON_B = 2;
	private static int BUTTON_C = 3;

	private GameObject btn_towerA;
	private GameObject btn_towerB;
	private GameObject btn_towerC;

	private TextMesh txt_message;

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
	void Start ()
	{
		// Khởi tạo vị trí tọa độ Y của torus, tọa độ Y này sẽ không thay đổi
		positionY_of_level = new float[9];

		// Lưu ý: POP luôn là trên cùng
		// Khởi tạo stack Tower A
		stkTowerA = new Stack<GameObject> ();

		// Khởi tạo stack Tower B
		stkTowerB = new Stack<GameObject> ();

		// Khởi tạo stack Tower C
		stkTowerC = new Stack<GameObject> ();

		// Lấy torus đồng thời đổ vào list tower A
		torus = new GameObject[9];
		for (int i = 1; i <= 8; i++) {
			torus [i] = GameObject.Find ("Torus (" + i + ")");
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
			stkTowerA.Push (torus [i]);
		}

		// Lấy button của Tower
		btn_towerA = GameObject.Find ("btn_towerA");
		btn_towerB = GameObject.Find ("btn_towerB");
		btn_towerC = GameObject.Find ("btn_towerC");
		txt_message = GameObject.Find ("message").GetComponent<TextMesh> ();


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
	public void OnButtonPressed (VirtualButtonAbstractBehaviour vButton)
	{
		switch (vButton.VirtualButtonName) {
		case "btn_towerA":
			if (hold) {
				Debug.Log ("On A Press");
				switch (flag) {
				case 2:
					MoveTorus (stkTowerB, stkTowerA);
					break;
				case 3:
					MoveTorus (stkTowerC, stkTowerA);
					break;
				}
				hold = false;
				AllButtonRelease ();
			} else {
				flag = 1;
				hold = true;
				OneButtonClose (BUTTON_A);
			}
			break;
		case "btn_towerB": 
			Debug.Log ("On B Press");
			if (hold) {
				switch (flag) {
				case 1:
					MoveTorus (stkTowerA, stkTowerB);
					break;
				case 3:
					MoveTorus (stkTowerC, stkTowerB);
					break;
				}
				hold = false;
				AllButtonRelease ();

			} else {
				flag = 2;
				hold = true;
				OneButtonClose (BUTTON_B);
			}
			break;
		case "btn_towerC": 
			Debug.Log ("On C Press");
			if (hold) {
				switch (flag) {
				case 1:
					MoveTorus (stkTowerA, stkTowerC);
					break;
				case 2:
					MoveTorus (stkTowerB, stkTowerC);
					break;
				}
				hold = false;
				AllButtonRelease ();

			} else {
				flag = 3;
				hold = true;
				OneButtonClose (BUTTON_C);
			}
			break;
		}
	}

	public void OnButtonReleased (VirtualButtonAbstractBehaviour vButton)
	{
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
	void Update ()
	{
		print (stkTowerA, pTowerA, defaultZ, positionY_of_level);
		print (stkTowerB, pTowerB, defaultZ, positionY_of_level);
		print (stkTowerC, pTowerC, defaultZ, positionY_of_level);
	}

	public static void print (Stack<GameObject> stkTower, float pTower, float defaultZ, float[] positionY_of_level)
	{
		int count = stkTower.Count;
		int element = 1;
		// item lấy từ 1 -> hết stack
		foreach (var item in stkTower) {
			item.transform.position = new Vector3 (pTower, positionY_of_level [8 - count + element], defaultZ);
			element++;
		}
	}

	public void AllButtonRelease(){
		btn_towerA.SetActive (true);
		btn_towerB.SetActive (true);
		btn_towerC.SetActive (true);
	}

	public void OneButtonClose(int button){
		btn_towerA.SetActive (!(button == BUTTON_A));
		btn_towerB.SetActive (!(button == BUTTON_B));
		btn_towerC.SetActive (!(button == BUTTON_C));
	}

	public void MoveTorus(Stack<GameObject> stk_from, Stack<GameObject> stk_to){
		if (stk_from.Count != 0) {
			GameObject temp_1 = stk_from.Peek ();
			if (stk_to.Count == 0) {
				stk_from.Pop ();
				stk_to.Push (temp_1);
				txt_message.text = "Good !!";
			} else {
				GameObject temp_2 = stk_to.Peek ();
				if (int.Parse (temp_1.name.Substring (7, 1)) < int.Parse (temp_2.name.Substring (7, 1))) {
					stk_from.Pop ();
					stk_to.Push (temp_1);
					txt_message.text = "Excellent !!";
				} else {
					txt_message.text = "Invalid !!";
				}
			}

		} else {
			txt_message.text = "Can't move !!";
		}
	}
}

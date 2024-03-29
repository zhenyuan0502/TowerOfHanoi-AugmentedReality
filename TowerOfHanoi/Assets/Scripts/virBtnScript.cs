﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Vuforia;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using System;

public class virBtnScript : MonoBehaviour, IVirtualButtonEventHandler
{
	// Sử dụng để gọi nhanh button ẩn - hiện (close - release)
	private static int BUTTON_A = 1;
	private static int BUTTON_B = 2;
	private static int BUTTON_C = 3;

	private GameObject btn_towerA;
	private GameObject btn_towerB;
	private GameObject btn_towerC;
	private GameObject btn_reset;
	private GameObject btn_continue;

	private TextMesh txt_message;
	private TextMesh txt_timer;

	private GameObject TowerA;
	private GameObject TowerB;
	private GameObject TowerC;

	private float pTowerC = 0;
	private float pTowerB = 0;
	private float pTowerA = 0;

	private float[] positionY_of_level;

	private Stack<GameObject> stkTowerA;
	private Stack<GameObject> stkTowerB;
	private Stack<GameObject> stkTowerC;

	private GameObject[] torus;

	public float defaultZ = 0;
	public float defaultX = 0;
	public float defaultY = 0;

	private bool isWin = false;
	private bool isHolding = false;
	private bool readyNow = false;
	private bool isPlaying = false;
	private bool isTorusMoving = false;

	private int flag = 1;

	// Vị trí của torus trong mảng
	private int PositionOfTorusIsBeingMoved = 0;

	private const int FLAG_TOWER_A = 1;
	private const int FLAG_TOWER_B = 2;
	private const int FLAG_TOWER_C = 3;

	private int AmoutOfDisk = 1;
	private bool isManualPlay = false;

	private int Steps = 0;
	private float Point = 0;
	private int MinimumSteps = 0;
	private float Timer = 0.0f;

	private bool FirstTimeWin = false;

	private AudioSource PerfectAudio;
	private AudioSource GreatAudio;
	private AudioSource BadAudio;
	private AudioSource WinAudio;
	private AudioSource VirtualButtonAudio;

	private Vector3 TempPosition_From;
	private Vector3 TempPosition_To;
	// Vị trí cao nhất mà torus muốn di chuyển
	private float HighestY = 0;
	// Object dùng để neo điểm Y
	private GameObject Anchor;
	// Use this for initialization
	void Start ()
	{
		InitComponents ();
		GetObjectPosition ();
		InitGameModeAndLevel ();
		InitStacks();
		InitFirstState ();
		InitListeners ();
		InitAudio ();

		if (isManualPlay) {
			ButtonManualMode ();
		} else {
			ButtonAutoMode ();
		}
	}

	void InitAudio() {
		PerfectAudio = GameObject.Find("PerfectAudio").GetComponent<AudioSource>();
		GreatAudio = GameObject.Find("GreatAudio").GetComponent<AudioSource>();
		BadAudio = GameObject.Find("BadAudio").GetComponent<AudioSource>();
		WinAudio = GameObject.Find("WinAudio").GetComponent<AudioSource>();
		VirtualButtonAudio = GameObject.Find("VirtualButtonAudio").GetComponent<AudioSource>();

		PerfectAudio.volume = AudioManager.soundSFX;
		GreatAudio.volume = AudioManager.soundSFX;
		BadAudio.volume = AudioManager.soundSFX;
		WinAudio.volume = AudioManager.soundSFX;
		VirtualButtonAudio.volume = AudioManager.soundSFX;
	}

	// Khi button được nhấn, chỉ thay đổi X và Y, không thay đổi Z
	// Thời gian cũng được đếm
	public void OnButtonPressed (VirtualButtonAbstractBehaviour vButton)
	{
		isPlaying = true;

		if (isManualPlay) {
			switch (vButton.VirtualButtonName) {
			case "btn_towerA":
				if (!isWin) {
					if (isHolding) {
						Debug.Log ("On A Press");
						switch (flag) {
						case FLAG_TOWER_B:
							StartCoroutine(MoveTorus (stkTowerB, stkTowerA));
							break;
						case FLAG_TOWER_C:
							StartCoroutine(MoveTorus (stkTowerC, stkTowerA));
							break;
						}
						isHolding = false;
						AllButtonReleaseExceptReset ();
					} else {
						flag = FLAG_TOWER_A;
						isHolding = true;
						OneButtonClose (BUTTON_A);

						VirtualButtonAudio.PlayOneShot (VirtualButtonAudio.clip);

					}
				}

				break;
			case "btn_towerB": 
				if (!isWin) {
					if (isHolding) {
						Debug.Log ("On B Press");

						switch (flag) {
						case FLAG_TOWER_A:
							StartCoroutine(MoveTorus (stkTowerA, stkTowerB));
							break;
						case FLAG_TOWER_C:
							StartCoroutine(MoveTorus (stkTowerC, stkTowerB));
							break;
						}
						isHolding = false;
						AllButtonReleaseExceptReset ();

					} else {
						flag = FLAG_TOWER_B;
						isHolding = true;
						OneButtonClose (BUTTON_B);

						VirtualButtonAudio.PlayOneShot (VirtualButtonAudio.clip);

					}
				}
				break;
			case "btn_towerC": 
				if (!isWin) {
					if (isHolding) {
						Debug.Log ("On C Press");

						switch (flag) {
						case FLAG_TOWER_A:
							StartCoroutine(MoveTorus (stkTowerA, stkTowerC));
							break;
						case FLAG_TOWER_B:
							StartCoroutine(MoveTorus (stkTowerB, stkTowerC));
							break;
						}
						isHolding = false;
						AllButtonReleaseExceptReset ();

					} else {
						flag = FLAG_TOWER_C;
						isHolding = true;
						OneButtonClose (BUTTON_C);

						VirtualButtonAudio.PlayOneShot (VirtualButtonAudio.clip);

					}
				}

				break;

			case "btn_reset":
				if (isWin) {
					Debug.Log ("On Reset Press");
					SceneManager.LoadScene ("Menu 3D");
				}
				break;
			}

		} else {
			switch (vButton.VirtualButtonName) {
			case "btn_continue":
				Debug.Log ("On Continue Press");
				if (!readyNow && !isHolding) {
					// bắt đầu tự động chạy game
					isPlaying = true;
					readyNow = true;
					btn_continue.SetActive (false);
					isHolding = true;

					VirtualButtonAudio.PlayOneShot (VirtualButtonAudio.clip);

				}
				break;
			case "btn_reset":
				Debug.Log ("On Reset Press");
				SceneManager.LoadScene ("Menu 3D");
				break;
			}
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
		case "btn_reset": 
			Debug.Log ("On Reset Release");
			break;
		}
	}


	public static void print (Stack<GameObject> stkTower, float pTower, float defaultZ, float[] positionY_of_level, int AmoutOfDisk)
	{
		int count = stkTower.Count;
		int element = 1;

		// item lấy từ 1 -> hết stack
		foreach (var item in stkTower) {
			item.transform.position = new Vector3 (pTower, positionY_of_level [AmoutOfDisk - count + element], defaultZ);
			element++;
		}
	}

	public void AllButtonReleaseExceptReset(){
		if (btn_towerA != null) {
			btn_towerA.SetActive (true);
		}
		if (btn_towerB != null) {
			btn_towerB.SetActive (true);
		}
		if (btn_towerC != null) {
			btn_towerC.SetActive (true);
		}
		if (btn_reset != null) {
			btn_reset.SetActive (false);

		}
	}

	public void AllButtonLockExceptReset(){
		if (btn_towerA != null) {
			btn_towerA.SetActive (false);
		}
		if (btn_towerB != null) {
			btn_towerB.SetActive (false);
		}
		if (btn_towerC != null) {
			btn_towerC.SetActive (false);
		}
		if (btn_reset != null) {
			btn_reset.SetActive (true);
		}
	}

	public void ButtonManualMode(){
		AllButtonReleaseExceptReset ();
		if (btn_continue != null) {
			btn_continue.SetActive (false);
		}
	}

	public void ButtonAutoMode(){
		AllButtonLockExceptReset ();
		if (btn_continue != null) {
			btn_continue.SetActive (true);
		}
	}

	public void OneButtonClose(int button){
		btn_towerA.SetActive (!(button == BUTTON_A));
		btn_towerB.SetActive (!(button == BUTTON_B));
		btn_towerC.SetActive (!(button == BUTTON_C));
	}

	public void InitStacks(){
		// Lưu ý: POP luôn là trên cùng

		// Khởi tạo stack Tower A
		stkTowerA = new Stack<GameObject> ();

		// Khởi tạo stack Tower B
		stkTowerB = new Stack<GameObject> ();

		// Khởi tạo stack Tower C
		stkTowerC = new Stack<GameObject> ();
	}

	public void InitComponents (){
		// Lấy Tower
		TowerC = GameObject.Find ("TowerC");
		TowerB = GameObject.Find ("TowerB");
		TowerA = GameObject.Find ("TowerA");
		Anchor = GameObject.Find ("Anchor");

		// Lấy button của Tower
		btn_towerA = GameObject.Find ("btn_towerA");
		btn_towerB = GameObject.Find ("btn_towerB");
		btn_towerC = GameObject.Find ("btn_towerC");
		btn_reset = GameObject.Find ("btn_reset");
		btn_continue = GameObject.Find ("btn_continue");

		txt_message = GameObject.Find ("message").GetComponent<TextMesh> ();
		txt_timer = GameObject.Find ("timer").GetComponent<TextMesh> ();
	}

	public void InitListeners(){
		if (btn_towerA != null) {
			btn_towerA.GetComponent<VirtualButtonBehaviour> ().RegisterEventHandler (this);
		}

		if (btn_towerB != null) {
			btn_towerB.GetComponent<VirtualButtonBehaviour> ().RegisterEventHandler (this);
		}

		if (btn_towerC != null) {
			btn_towerC.GetComponent<VirtualButtonBehaviour> ().RegisterEventHandler (this);

		}

		if (btn_reset != null) {
			btn_reset.GetComponent<VirtualButtonBehaviour> ().RegisterEventHandler (this);
		}

		if (btn_continue != null) {
			btn_continue.GetComponent<VirtualButtonBehaviour> ().RegisterEventHandler (this);
		}
	}

	public void InitGameModeAndLevel(){
		// Lấy giá trị level hiện tại
		AmoutOfDisk = GameLevel.currentLevel;

		// Lấy chế độ hiện tại: người chơi hoặc máy tự chơi
		isManualPlay = GameLevel.isManualPlay;
	}

	public void GetObjectPosition(){
		// Lấy vị trí của các cột
		pTowerC = TowerC.transform.position.x;
		pTowerB = TowerB.transform.position.x;
		pTowerA = TowerA.transform.position.x;

		// Lấy Z mặc định (của cột)
		defaultZ = TowerA.transform.position.z;

		// Khởi tạo vị trí tọa độ Y của torus, tọa độ Y này sẽ không thay đổi
		positionY_of_level = new float[9];

		// Lấy giá trị điểm neo Y
		HighestY = Anchor.transform.position.y;
	}

	public void InitFirstState(){
		// Lấy torus đồng thời đổ vào list tower A
		torus = new GameObject[9];
		for (int i = 1, j = 1; i <= 8; i++) {
			torus [i] = GameObject.Find ("Torus (" + i + ")");

			if (i >= 8 - AmoutOfDisk + j) {
				if (torus [i] != null) {
					positionY_of_level [j] = torus [i].transform.position.y;
					++j;
				}
			}
		}

//		for (int i = AmoutOfDisk + 1; i <= 8; i++) {
//			if (torus [i] != null) {
//				torus [i].SetActive (false);
//			}
//		}

		//		default								8 torus								3 torus
		//		torus[1].transfrom.position.y		positionY_of_level 1: -
		//		torus[2].transfrom.position.y		positionY_of_level 2: --
		//		torus[3].transfrom.position.y		positionY_of_level 3: ---
		//		torus[4].transfrom.position.y		positionY_of_level 4: ----
		//		torus[5].transfrom.position.y		positionY_of_level 5: -----
		//		torus[6].transfrom.position.y		positionY_of_level 6: ------		positionY_of_level 1: -
		//		torus[7].transfrom.position.y		positionY_of_level 7: -------		positionY_of_level 2: --
		//		torus[8].transfrom.position.y		positionY_of_level 8: --------		positionY_of_level 3: ---

		for (int i = AmoutOfDisk; i >= 1; i--) {
			// Đổ vào list A
			stkTowerA.Push (torus [i]);
		}

		// Ẩn btn reset
		if (btn_reset != null) {
			btn_reset.SetActive(false);
		}

		if (txt_message != null) {
			txt_message.text = "Amout of Disk: " + AmoutOfDisk;
		}

	}

	public float DeterminePositionX (Stack<GameObject> stk_to){
		if (stk_to.Equals(stkTowerA)) {
			return pTowerA;
		} else if (stk_to.Equals(stkTowerB)){
			return pTowerB;
		} else if (stk_to.Equals(stkTowerC)){
			return pTowerC;
		}
		return 0;
	}

	public int DetermineWhoIsBeingMoved (Stack<GameObject> stk_from){
		if (stk_from.Count >= 0) {
			for (int i = 1; i <= AmoutOfDisk; i++) {
				if (stk_from.Peek().Equals(torus[i])){
					return i;
				}
			}
		}
		return 0;
	}

	public IEnumerator MoveTorus(Stack<GameObject> stk_from, Stack<GameObject> stk_to){
		// Đợi cho đến khi isTorusMoving == false => khi hết di chuyển
		if (isTorusMoving) {
			Debug.Log ("Is Waiting end of movement");
			yield return new WaitUntil(() => isTorusMoving == false);
		}

		isTorusMoving = true;
		if (stk_from.Count != 0) {
			GameObject temp_1 = stk_from.Peek ();
			PositionOfTorusIsBeingMoved = DetermineWhoIsBeingMoved (stk_from);
			TempPosition_From = temp_1.transform.position;
			if (stk_to.Count == 0) {
				stk_from.Pop ();
				stk_to.Push (temp_1);
				Steps++;
				TempPosition_To = new Vector3(DeterminePositionX(stk_to), positionY_of_level[AmoutOfDisk], defaultZ);
				GreatAudio.PlayOneShot (GreatAudio.clip);
				txt_message.text = "Good !!\nSteps:" + Steps;
			} else {
				GameObject temp_2 = stk_to.Peek ();
				if (int.Parse (temp_1.name.Substring (7, 1)) < int.Parse (temp_2.name.Substring (7, 1))) {
					stk_from.Pop ();
					stk_to.Push (temp_1);
					Steps++; 
					TempPosition_To = new Vector3(temp_2.transform.position.x, positionY_of_level[positionY_of_level.Length - stk_to.Count], temp_2.transform.position.z);
					PerfectAudio.PlayOneShot (PerfectAudio.clip);
					txt_message.text = "Excellent !!\nSteps:" + Steps;
				} else {
					BadAudio.PlayOneShot (BadAudio.clip);
					TempPosition_To = TempPosition_From;
					txt_message.text = "Invalid !!";
				}
			}
		} else {
			BadAudio.PlayOneShot (BadAudio.clip);
			TempPosition_To = TempPosition_From;
			txt_message.text = "Can't move !!";
		}
		isTorusMoving = false;

		yield break;

	}

	void printAll(){
		print (stkTowerA, pTowerA, defaultZ, positionY_of_level, AmoutOfDisk);
		print (stkTowerB, pTowerB, defaultZ, positionY_of_level, AmoutOfDisk);
		print (stkTowerC, pTowerC, defaultZ, positionY_of_level, AmoutOfDisk);
	}

	// Cần fix button
	public IEnumerator AutoMoveTorus(Stack<GameObject> A, Stack<GameObject> B, Stack<GameObject> C, int AmoutOfDisk)
	{
		readyNow = false;
		if (A != null && B != null && C != null) {
			if (AmoutOfDisk % 2 == 0)
			{
				while (isPlaying)
				{
					if (C.Count != AmoutOfDisk)
					{
						if (A.Count == 0)
						{
							yield return new WaitForSeconds( 1 ); 
							StartCoroutine(MoveTorus (B, A));
						}
						else if (B.Count == 0)
						{
							yield return new WaitForSeconds( 1 ); 
							StartCoroutine(MoveTorus (A, B));
						}
						else
						{
							if (A.Count > 0 && B.Count > 0) {

								var disk1 = A.Peek ();
								var disk2 = B.Peek ();
								if (int.Parse (disk1.name.Substring (7, 1)) < int.Parse (disk2.name.Substring (7, 1))) {
									yield return new WaitForSeconds (1);
									StartCoroutine (MoveTorus (A, B));
								} else {
									yield return new WaitForSeconds (1);
									StartCoroutine (MoveTorus (B, A));
								}
							}
						}
					}
					else break;

					if (C.Count != AmoutOfDisk)
					{
						if (A.Count == 0)
						{
							yield return new WaitForSeconds( 1 ); 
							StartCoroutine(MoveTorus (C, A));
						}
						else
							if (C.Count == 0)
							{
								yield return new WaitForSeconds( 1 ); 
								StartCoroutine(MoveTorus (A, C));
							}
							else
							{
							if (A.Count > 0 && C.Count > 0) {

								var disk1 = A.Peek ();
								var disk2 = C.Peek ();
								if (int.Parse (disk1.name.Substring (7, 1)) < int.Parse (disk2.name.Substring (7, 1))) {
									yield return new WaitForSeconds (1);
										StartCoroutine(MoveTorus (A, C));
								} else {
									yield return new WaitForSeconds (1);
										StartCoroutine(MoveTorus (C, A));
								}
							}
							}
					}
					else break;

					if (C.Count != AmoutOfDisk)
					{
						if (B.Count == 0)
						{
							yield return new WaitForSeconds( 1 ); 
							StartCoroutine(MoveTorus (C, B));
						}
						else
							if (C.Count == 0)
							{
								yield return new WaitForSeconds( 1 ); 
								StartCoroutine(MoveTorus (B, C));
							}
							else
							{
							if (B.Count > 0 && C.Count > 0) {

								var disk1 = B.Peek ();
								var disk2 = C.Peek ();
								if (int.Parse (disk1.name.Substring (7, 1)) < int.Parse (disk2.name.Substring (7, 1))) {
									yield return new WaitForSeconds (1);
										StartCoroutine(MoveTorus (B, C));
								} else {
									yield return new WaitForSeconds (1);
										StartCoroutine(MoveTorus (C, B));
								}
							}
							}
					}  
					else break;
				}
			}
			else
			{
				while (isPlaying)
				{
					if (C.Count != AmoutOfDisk)
					{
						if (A.Count == 0)
						{
							yield return new WaitForSeconds( 1 ); 
							StartCoroutine(MoveTorus (C, A));
						}
						else
							if (C.Count == 0)
							{
								yield return new WaitForSeconds( 1 ); 
								StartCoroutine(MoveTorus (A, C));
							}
							else
							{	
								if (A.Count > 0 && C.Count > 0) {
									var disk1 = A.Peek();
									var disk2 = C.Peek();
									if (int.Parse (disk1.name.Substring (7, 1)) < int.Parse (disk2.name.Substring (7, 1)))
									{
										yield return new WaitForSeconds( 1 ); 
										StartCoroutine(MoveTorus (A, C));
									}
									else
									{
										yield return new WaitForSeconds( 1 ); 
										StartCoroutine(MoveTorus (C, A));
									}
								}
							}
					}
					else break;
					if (C.Count != AmoutOfDisk)
					{
						if (A.Count == 0)
						{
							yield return new WaitForSeconds( 1 ); StartCoroutine(MoveTorus (B, A));
						}
						else
							if (B.Count == 0)
							{
								yield return new WaitForSeconds( 1 ); StartCoroutine(MoveTorus (A, B));
							}
							else
							{
								if (A.Count > 0 && B.Count > 0) {

									var disk1 = A.Peek ();
									var disk2 = B.Peek ();
									if (int.Parse (disk1.name.Substring (7, 1)) < int.Parse (disk2.name.Substring (7, 1))) {
										yield return new WaitForSeconds (1);
										StartCoroutine(MoveTorus (A, B));
									} else {
										yield return new WaitForSeconds (1);
										StartCoroutine(MoveTorus (B, A));
									}
								}	
							}
					}
					else break;
					if (C.Count != AmoutOfDisk)
					{
						if (B.Count == 0)
						{
							yield return new WaitForSeconds( 1 ); StartCoroutine(MoveTorus (C, B));
						}
						else
							if (C.Count == 0)
							{
								yield return new WaitForSeconds( 1 ); StartCoroutine(MoveTorus (B, C));
							}
							else
							{
							if (B.Count > 0 && C.Count > 0) {

								var disk1 = B.Peek ();
								var disk2 = C.Peek ();
								if (int.Parse (disk1.name.Substring (7, 1)) < int.Parse (disk2.name.Substring (7, 1))) {
									yield return new WaitForSeconds (1);
										StartCoroutine(MoveTorus (B, C));
								} else {
									yield return new WaitForSeconds (1);
										StartCoroutine(MoveTorus (C, B));
								}
							}
							}
					}
					else break;
				}
			}
		}
		readyNow = true;
	}

	// Update is called once per frame
	void Update ()
	{	
		if (stkTowerC.Count == AmoutOfDisk) {
			MinimumSteps = ((int)Mathf.Pow (2.0f, AmoutOfDisk)) - 1;
			//			(MinimumSteps - (Steps - MinimumSteps))*100/MinimumSteps
			Point = (2 * MinimumSteps - Steps) * 100 / MinimumSteps;

			if (!FirstTimeWin) {
				WinAudio.PlayOneShot (WinAudio.clip);
				FirstTimeWin = true;
			}

			txt_message.text = "You Win !!!\nSteps " + Steps + " - Point " + Point +"\nMinimum Steps " + MinimumSteps +  "\nClick to comeback";
			isWin = true;
			AllButtonLockExceptReset ();

			if (!isManualPlay) {
				btn_continue.SetActive (false);
			}
		} else {
			if (isPlaying) {
				Timer += Time.deltaTime;
			}
		}

		// Cập nhật thời gian
		if (txt_timer != null && isPlaying) {
			string minutes = ((int)Timer / 60).ToString();
			string seconds = (Timer % 60).ToString("F2");
			txt_timer.text = minutes + ":" + seconds;
		}

		if (!isManualPlay && readyNow && isPlaying)  {
			StartCoroutine (AutoMoveTorus(stkTowerA, stkTowerB, stkTowerC, AmoutOfDisk));
			if (stkTowerC.Count == AmoutOfDisk) {
				isPlaying = false;
			}
		}

		if (!isTorusMoving && TempPosition_From.Equals(TempPosition_To)) {
			printAll ();
			TempPosition_To = TempPosition_From;
			Debug.Log ("Print All");
		} else {
			printWithMovingEffect ();
		}
	}

	// Tốc độ di chuyển
	private float SpeedMoving = 10f;

	// giai đoạn 1: đi lên, X giữ nguyên Y thay đổi
	// giai đoạn 2: đi ngang, X thay đổi Y giữ nguyên
	// giai đoạn 3: đi xuống, X giữ nguyên, Y thay đổi
	private int StageMoving = 1;

	// Ý tưởng phần này là di chuyển các torus tới gần vị trí cho phép sau đó lập tức set = vị trí đó
	// Di chuyển qua các giai đoạn có các anchor khác nhau.
	void printWithMovingEffect(){
		// Lý do còn nhảy là do chưa in những phần tử bất động ra.
		// Còn thiếu đường đi hình vuông
		if (torus [PositionOfTorusIsBeingMoved] != null) {
			printAllExceptTorusIsMoving ();

			if (StageMoving == 1) {
				Debug.Log ("StageMoving = 1");

				if (TempPosition_From.y > HighestY) {
					TempPosition_From.y -= SpeedMoving * Time.deltaTime;
				} else {
					TempPosition_From.y += SpeedMoving * Time.deltaTime;
				}

				if (Math.Round (TempPosition_From.y) == Math.Round(HighestY)) {
					TempPosition_From.y = HighestY;
					StageMoving = 2;
					return;
				}
			} else if (StageMoving == 2) {
				Debug.Log ("StageMoving = 2");

				if (TempPosition_From.x > TempPosition_To.x) {
					TempPosition_From.x -= SpeedMoving * Time.deltaTime;
				} else {
					TempPosition_From.x += SpeedMoving * Time.deltaTime;
				}

				if (Math.Round (TempPosition_To.x) == Math.Round (TempPosition_From.x)) {
					TempPosition_From.x = TempPosition_To.x;

					StageMoving = 3;
					return;
				}
			} else if (StageMoving == 3) {
				Debug.Log ("StageMoving = 3");

				if (TempPosition_From.y > TempPosition_To.y) {
					TempPosition_From.y -= SpeedMoving * Time.deltaTime;
				} else {
					TempPosition_From.y += SpeedMoving * Time.deltaTime;
				}

				if (Math.Round (TempPosition_To.y) == Math.Round (TempPosition_From.y)) {
					TempPosition_From = TempPosition_To;

					StageMoving = 1;
					return;

				}
			}

			Debug.Log ("Is Moving");
			torus [PositionOfTorusIsBeingMoved].transform.position = TempPosition_From;

		}

		Debug.Log ("No Torus Is Being Moved");
	}

	public void printExceptTorusIsMoving (Stack<GameObject> stkTower, float pTower, float defaultZ, float[] positionY_of_level, int AmoutOfDisk)
	{
		int count = stkTower.Count;
		int element = 1;

		// item lấy từ 1 -> hết stack ngoại trừ item đang chạy
		foreach (var item in stkTower) {
			if (!item.Equals (torus [PositionOfTorusIsBeingMoved])) {
				item.transform.position = new Vector3 (pTower, positionY_of_level [AmoutOfDisk - count + element], defaultZ);
			}
			element++;
		}
	}

	// In hết tất cả các torus ngoại trừ torus đang chạy
	void printAllExceptTorusIsMoving(){
		printExceptTorusIsMoving (stkTowerA, pTowerA, defaultZ, positionY_of_level, AmoutOfDisk);
		printExceptTorusIsMoving (stkTowerB, pTowerB, defaultZ, positionY_of_level, AmoutOfDisk);
		printExceptTorusIsMoving (stkTowerC, pTowerC, defaultZ, positionY_of_level, AmoutOfDisk);
	}
}

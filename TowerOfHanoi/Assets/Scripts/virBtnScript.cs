using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Vuforia;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

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

	bool isWin = false;
	bool isHolding = false;
	bool readyNow = false;
	bool isPlaying = false;

	int flag = 1;

	private const int FLAG_TOWER_A = 1;
	private const int FLAG_TOWER_B = 2;
	private const int FLAG_TOWER_C = 3;

	int AmoutOfDisk = 1;
	bool isManualPlay = false;

	int Steps = 0;
	float Point = 0;
	int MinimumSteps = 0;
	float Timer = 0.0f;

	bool FirstTimeWin = false;

	private AudioSource PerfectAudio;
	private AudioSource GreatAudio;
	private AudioSource BadAudio;
	private AudioSource WinAudio;
	private AudioSource VirtualButtonAudio;

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
							MoveTorus (stkTowerB, stkTowerA);
							break;
						case FLAG_TOWER_C:
							MoveTorus (stkTowerC, stkTowerA);
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
							MoveTorus (stkTowerA, stkTowerB);
							break;
						case FLAG_TOWER_C:
							MoveTorus (stkTowerC, stkTowerB);
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
							MoveTorus (stkTowerA, stkTowerC);
							break;
						case FLAG_TOWER_B:
							MoveTorus (stkTowerB, stkTowerC);
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

	public void MoveTorus(Stack<GameObject> stk_from, Stack<GameObject> stk_to){
		if (stk_from.Count != 0) {
			GameObject temp_1 = stk_from.Peek ();
			if (stk_to.Count == 0) {
				stk_from.Pop ();
				stk_to.Push (temp_1);
				Steps++;
				GreatAudio.PlayOneShot (GreatAudio.clip);
				txt_message.text = "Good !!\nSteps:" + Steps;
			} else {
				GameObject temp_2 = stk_to.Peek ();
				if (int.Parse (temp_1.name.Substring (7, 1)) < int.Parse (temp_2.name.Substring (7, 1))) {
					stk_from.Pop ();
					stk_to.Push (temp_1);
					Steps++;
					PerfectAudio.PlayOneShot (PerfectAudio.clip);
					txt_message.text = "Excellent !!\nSteps:" + Steps;
				} else {
					BadAudio.PlayOneShot (BadAudio.clip);
					txt_message.text = "Invalid !!";
				}
			}

		} else {
			BadAudio.PlayOneShot (BadAudio.clip);
			txt_message.text = "Can't move !!";
		}
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
							yield return new WaitForSeconds( 1 ); MoveTorus (B, A);
						}
						else if (B.Count == 0)
						{
							yield return new WaitForSeconds( 1 ); MoveTorus (A, B);
						}
						else
						{
							if (A.Count > 0 && B.Count > 0) {

								var disk1 = A.Peek ();
								var disk2 = B.Peek ();
								if (int.Parse (disk1.name.Substring (7, 1)) < int.Parse (disk2.name.Substring (7, 1))) {
									yield return new WaitForSeconds (1);
									MoveTorus (A, B);
								} else {
									yield return new WaitForSeconds (1);
									MoveTorus (B, A);
								}
							}
						}
					}
					else break;

					if (C.Count != AmoutOfDisk)
					{
						if (A.Count == 0)
						{
							yield return new WaitForSeconds( 1 ); MoveTorus (C, A);
						}
						else
							if (C.Count == 0)
							{
								yield return new WaitForSeconds( 1 ); MoveTorus (A, C);
							}
							else
							{
							if (A.Count > 0 && C.Count > 0) {

								var disk1 = A.Peek ();
								var disk2 = C.Peek ();
								if (int.Parse (disk1.name.Substring (7, 1)) < int.Parse (disk2.name.Substring (7, 1))) {
									yield return new WaitForSeconds (1);
									MoveTorus (A, C);
								} else {
									yield return new WaitForSeconds (1);
									MoveTorus (C, A);
								}
							}
							}
					}
					else break;

					if (C.Count != AmoutOfDisk)
					{
						if (B.Count == 0)
						{
							yield return new WaitForSeconds( 1 ); MoveTorus (C, B);
						}
						else
							if (C.Count == 0)
							{
								yield return new WaitForSeconds( 1 ); MoveTorus (B, C);
							}
							else
							{
							if (B.Count > 0 && C.Count > 0) {

								var disk1 = B.Peek ();
								var disk2 = C.Peek ();
								if (int.Parse (disk1.name.Substring (7, 1)) < int.Parse (disk2.name.Substring (7, 1))) {
									yield return new WaitForSeconds (1);
									MoveTorus (B, C);
								} else {
									yield return new WaitForSeconds (1);
									MoveTorus (C, B);
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
							yield return new WaitForSeconds( 1 ); MoveTorus (C, A);
						}
						else
							if (C.Count == 0)
							{
								yield return new WaitForSeconds( 1 ); MoveTorus (A, C);
							}
							else
							{	
								if (A.Count > 0 && C.Count > 0) {
									var disk1 = A.Peek();
									var disk2 = C.Peek();
									if (int.Parse (disk1.name.Substring (7, 1)) < int.Parse (disk2.name.Substring (7, 1)))
									{
										yield return new WaitForSeconds( 1 ); MoveTorus (A, C);
									}
									else
									{
										yield return new WaitForSeconds( 1 ); MoveTorus (C, A);
									}
								}
							}
					}
					else break;
					if (C.Count != AmoutOfDisk)
					{
						if (A.Count == 0)
						{
							yield return new WaitForSeconds( 1 ); MoveTorus (B, A);
						}
						else
							if (B.Count == 0)
							{
								yield return new WaitForSeconds( 1 ); MoveTorus (A, B);
							}
							else
							{
								if (A.Count > 0 && B.Count > 0) {

									var disk1 = A.Peek ();
									var disk2 = B.Peek ();
									if (int.Parse (disk1.name.Substring (7, 1)) < int.Parse (disk2.name.Substring (7, 1))) {
										yield return new WaitForSeconds (1);
										MoveTorus (A, B);
									} else {
										yield return new WaitForSeconds (1);
										MoveTorus (B, A);
									}
								}	
							}
					}
					else break;
					if (C.Count != AmoutOfDisk)
					{
						if (B.Count == 0)
						{
							yield return new WaitForSeconds( 1 ); MoveTorus (C, B);
						}
						else
							if (C.Count == 0)
							{
								yield return new WaitForSeconds( 1 ); MoveTorus (B, C);
							}
							else
							{
							if (B.Count > 0 && C.Count > 0) {

								var disk1 = B.Peek ();
								var disk2 = C.Peek ();
								if (int.Parse (disk1.name.Substring (7, 1)) < int.Parse (disk2.name.Substring (7, 1))) {
									yield return new WaitForSeconds (1);
									MoveTorus (B, C);
								} else {
									yield return new WaitForSeconds (1);
									MoveTorus (C, B);
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

		printAll ();
	}
}

//
//  PreferenceViewController.swift
//  LuckyOrNot
//
//  Created by Lim Oh Ju on 11/8/16.
//  Copyright © 2016 jude. All rights reserved.
//

import UIKit

class PreferenceViewController: UIViewController {
	
	var eunjung = 0
	var ohju = 0
	var sungjin = 0
	var jinkyu = 0
	var lucky1 = ""
	var lucky2 = ""
	
	var lucky1Prefer = (false, false)
	var lucky2Prefer = (false, false)
	
	var choice1 = ""
	var choice2 = ""
	var eunjungPrefer1 = false
	var eunjungPrefer2 = false
	var ohjuPrefer1 = false
	var ohjuPrefer2 = false
	var sungjinPrefer1 = false
	var sungjinPrefer2 = false
	var jinkyuPrefer1 = false
	var jinkyuPrefer2 = false
	
	var flipMessage = "" // 두 사람의 니즈를 모두 만족 시 💕, 한 사람의 니즈를 만족 시 👏, 두 사람 모두 상관 없다고 했을 때 🕊, 한 사람의 니즈는 반영되지 않았을 때 😭, 선호챕터설정으로 flip이 됐을 때 🔃
	
	func flipChoice() {
		choice1 = lucky2
		choice2 = lucky1
	}
	
	func normalChoice() {
		choice1 = lucky1
		choice2 = lucky2
	}
	
	func applyPreference() { // 챕터 두 개를 모두 선호하던지, 모두 선호하지 않던지 똑같은 경우의 수로 수렴.
		if lucky1Prefer.0 != lucky1Prefer.1 && lucky2Prefer.0 != lucky2Prefer.1 { // 둘 다 선호 챕터가 분명히 있을 경우
			if lucky1Prefer == lucky2Prefer { // 선호 챕터가 분명히 있지만 그게 겹칠 경우
				normalChoice()
				flipMessage = "😭"
			} else { // 어떻게 다를지는 모르겠지만, 두 사람이 선호하는 내용이 서로 다름.
				if lucky1Prefer.1 == true {
					flipChoice()
					flipMessage = "💕🔃"
				} else {
					normalChoice()
					flipMessage = "💕"
				}
			}
	 // else if lucky1Prefer.0 == lucky1Prefer.1 || lucky2Prefer.0 == lucky2Prefer.1
		} else { // 둘 중 한 명이라도 아무거나 걸려도 상관 없다고 했을 때
			if lucky1Prefer.0 != lucky1Prefer.1 { // 상관없다고 한 사람이 lucky2
				if lucky1Prefer.1 == true {
					flipChoice() //순리대로라면 lucky1의 선호가 반영되지 않았을텐데 결과 뒤집혔으니 박수를 쳐줌.
					flipMessage = "👏🔃"
				} else { //뒤집어지진 않더라도 lucky1의 선호는 반영됐으므로 박수를 쳐줌.
					normalChoice()
					flipMessage = "👏"
				}
			} else if lucky2Prefer.0 != lucky2Prefer.1 { // 상관없다고 한 사람이 lucky1
				if lucky2Prefer.0 == true {
					flipChoice()
					flipMessage = "👏🔃"
				} else {
					normalChoice()
					flipMessage = "👏"
				}
			} else if lucky1Prefer == lucky2Prefer { // 둘 다 상관 없다고 했을 때
				normalChoice()
				flipMessage = "🕊"
			}
		}
	}
	
	func luckyOrNot() {
		eunjung = Int(arc4random_uniform(100))
		ohju = Int(arc4random_uniform(100))
		sungjin = Int(arc4random_uniform(100))
		jinkyu = Int(arc4random_uniform(100))
		switch min(eunjung, ohju, sungjin, jinkyu){
		case eunjung:
			lucky1 = "은정(1)"
			lucky1Prefer = (eunjungPrefer1, eunjungPrefer2)
		case ohju:
			lucky1 = "오주(1)"
			lucky1Prefer = (ohjuPrefer1, ohjuPrefer2)
		case sungjin:
			lucky1 = "성진(1)"
			lucky1Prefer = (sungjinPrefer1, sungjinPrefer2)
		case jinkyu:
			lucky1 = "진규(1)"
			lucky1Prefer = (jinkyuPrefer1, jinkyuPrefer2)
		default:
			break
		}
		switch max(eunjung, ohju, sungjin, jinkyu){
		case eunjung:
			lucky2 = "은정(2)"
			lucky2Prefer = (eunjungPrefer1, eunjungPrefer2)
		case ohju:
			lucky2 = "오주(2)"
			lucky2Prefer = (ohjuPrefer1, ohjuPrefer2)
		case sungjin:
			lucky2 = "성진(2)"
			lucky2Prefer = (sungjinPrefer1, sungjinPrefer2)
		case jinkyu:
			lucky2 = "진규(2)"
			lucky2Prefer = (jinkyuPrefer1, jinkyuPrefer2)
		default:
			break
		}
		
		applyPreference()
		let message = "\(flipMessage)\n✔️첫번째 발표자: \(choice1)\n✔️두번째 발표자: \(choice2)"
		let showAlert = UIAlertController(title: "Lucky guys!", message: message, preferredStyle: .alert)
		let alertAction	= UIAlertAction(title: "OK", style: .default, handler: nil)
		showAlert.addAction(alertAction)
		present(showAlert, animated: true, completion: nil)
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	@IBAction func cancel() {
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func done() {
		luckyOrNot()
	}
	
	@IBAction func eunjungSwitch1(_ sender: UISwitch) {
		if eunjungPrefer1 == false {
			eunjungPrefer1 = true
		} else {
			eunjungPrefer1 = false
		}
	}
	@IBAction func eunjungSwitch2(_ sender: UISwitch) {
		if eunjungPrefer2 == false {
			eunjungPrefer2 = true
		} else {
			eunjungPrefer2 = false
		}
	}
	
	@IBAction func ohjuSwitch1(_ sender: UISwitch) {
		if ohjuPrefer1 == false {
			ohjuPrefer1 = true
		} else {
			ohjuPrefer1 = false
		}
	}
	@IBAction func ohjuSwitch2(_ sender: UISwitch) {
		if ohjuPrefer2 == false {
			ohjuPrefer2 = true
		} else {
			ohjuPrefer2 = false
		}
	}
	
	@IBAction func sungjinSwitch1(_ sender: UISwitch) {
		if sungjinPrefer1 == false {
			sungjinPrefer1 = true
		} else {
			sungjinPrefer1 = false
		}
	}
	@IBAction func sungjinSwitch2(_ sender: UISwitch) {
		if sungjinPrefer2 == false {
			sungjinPrefer2 = true
		} else {
			sungjinPrefer2 = false
		}
	}
	
	@IBAction func jinkyuSwitch1(_ sender: UISwitch) {
		if jinkyuPrefer1 == false {
			jinkyuPrefer1 = true
		} else {
			jinkyuPrefer1 = false
		}
	}
	@IBAction func jinkyuSwitch2(_ sender: UISwitch) {
		if jinkyuPrefer2 == false {
			jinkyuPrefer2 = true
		} else {
			jinkyuPrefer2 = false
		}
	}



}

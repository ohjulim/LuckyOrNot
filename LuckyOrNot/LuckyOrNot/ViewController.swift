//
//  ViewController.swift
//  LuckyOrNot
//
//  Created by Lim Oh Ju on 10/22/16.
//  Copyright © 2016 jude. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var eunjung = 0
	var ohju = 0
	var sungjin = 0
	var jinkyu = 0
	var lucky1 = ""
	var lucky2 = ""
	
	@IBOutlet weak var lucky1Label: UILabel!
	@IBOutlet weak var lucky2Label: UILabel!
	
	@IBAction func luckyOrNot() {
		eunjung = Int(arc4random_uniform(100))
		ohju = Int(arc4random_uniform(100))
		sungjin = Int(arc4random_uniform(100))
		jinkyu = Int(arc4random_uniform(100))
		switch min(eunjung, ohju, sungjin, jinkyu){
		case eunjung:
			lucky1 = "은정"
		case ohju:
			lucky1 = "오주"
		case sungjin:
			lucky1 = "성진"
		case jinkyu:
			lucky1 = "진규"
		default:
			break
		}
		switch max(eunjung, ohju, sungjin, jinkyu){
		case eunjung:
			lucky2 = "은정"
		case ohju:
			lucky2 = "오주"
		case sungjin:
			lucky2 = "성진"
		case jinkyu:
			lucky2 = "진규"
		default:
			break
		}
		updateLabel()
	}
	
	func updateLabel() {
		lucky1Label.text = String(lucky1)
		lucky2Label.text = String(lucky2)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}


//
//  ViewController.swift
//  Stopwatch
//
//  Created by Anudeep Reddy Dwaram on 22/05/15.
//  Copyright (c) 2015 iDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var timer = NSTimer()
	var count = 0
	var playButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: nil, action: Selector("playButtonPressed"))
	var pauseButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Pause, target: nil, action: Selector("pauseButtonPressed"))
	
	@IBOutlet weak var time: UILabel!
	@IBOutlet weak var toolbar: UIToolbar!
	
	
	func updateTime() {
		count++
		time.text = String(count) // time.text = "\(count)"
	}
	
	@IBAction func stopButton(sender: AnyObject) {
		timer.invalidate()
		count = 0
		time.text = String(count)
		let toolBarItems = [playButton]
		toolbar.setItems(toolBarItems, animated: false)

	}
	
	func pauseButtonPressed() {
		timer.invalidate()
		let toolBarItems = [playButton]
		toolbar.setItems(toolBarItems, animated: false)
	}
	
	func playButtonPressed() {
		let toolBarItems = [pauseButton]
		timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
		toolbar.setItems(toolBarItems, animated: true)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		time.text = "0"
		let toolBarItems = [playButton]
		toolbar.setItems(toolBarItems, animated: true)
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}


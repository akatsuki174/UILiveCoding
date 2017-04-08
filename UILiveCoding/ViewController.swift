//
//  ViewController.swift
//  UILiveCoding
//
//  Created by akatsuki174 on 2017/04/02.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    private var timer = Timer()
    private var count = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startTimer(_ sender: Any) {
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        if timer.isValid {
            timer.invalidate()
        }
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        timer.invalidate()
        count = 0.0
        timerLabel.text = String(format: "%.1f", count)
    }
    
    @objc private func updateTimer() {
        count += 0.1
        timerLabel.text = String(format: "%.1f", count)
    }
    
}


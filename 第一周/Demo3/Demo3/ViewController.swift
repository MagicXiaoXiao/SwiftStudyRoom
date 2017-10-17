//
//  ViewController.swift
//  Demo3
//
//  Created by 陈晓波 on 2017/10/18.
//  Copyright © 2017年 漫不经心魔导师. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    var isPlay = false
    
    var number:Double = 0.0 {
        didSet{
            self.mainLabel.text = String(format: "%.1f", number)
        }
    }
    
    lazy var timer: DispatchSourceTimer = {
        let gcdTimer = DispatchSource.makeTimerSource(flags: .strict, queue: DispatchQueue.main)
        gcdTimer.schedule(deadline: .now(), repeating: .milliseconds(200), leeway: .never)
        return gcdTimer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer.setEventHandler(handler: {
            self.number += 0.1
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetAction(_ sender: UIButton) {
        if isPlay { timer.suspend(); isPlay = false }
        number = 0.0
    }
    
    @IBAction func playAction(_ sender: UIButton) {
        if !isPlay { timer.resume(); isPlay = true }
        
    }
    
    @IBAction func stopAction(_ sender: UIButton) {
        if isPlay { timer.suspend(); isPlay = false }
        
    }
    
    
}


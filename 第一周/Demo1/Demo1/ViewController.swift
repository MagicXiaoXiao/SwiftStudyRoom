//
//  ViewController.swift
//  Demo1
//
//  Created by 陈晓波 on 2017/10/16.
//  Copyright © 2017年 漫不经心魔导师. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipPriceLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateLabelData(slider: UISlider) -> Void {
        let tip = NSNumber(value: slider.value*100)
        let number = NSDecimalNumber(string: textField.text)
        let tipPrice = number.floatValue/100*Float(tip.intValue)
        tipLabel.text = "Tip(%\(tip.intValue))"
        tipPriceLabel.text = "$\(tipPrice)"
        totalPriceLabel.text = "$\(tipPrice + number.floatValue)"
    }
    
    @IBAction func changeSliderValue(_ sender: UISlider) {
        updateLabelData(slider: sender)
    }
    
    
    @IBAction func textFieldChangeValue(_ sender: UITextField) {
        updateLabelData(slider: slider)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}


//
//  ViewController.swift
//  Demo3
//
//  Created by 漫不经心的魔导师 on 2017/10/27.
//  Copyright © 2017年 卡塞尔学院. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var DoTypes: [UIButton]!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePick: UIDatePicker!
    
    weak var delegate: NavigtionPopDelegate?
    
    var data:(todo: ToDo, index: Int)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = data {
            title = "Edit Todo"
            DoTypes.forEach{ $0.isSelected = false }
            
            switch data.todo.icon {
            case .talk:
                DoTypes.filter{ $0.tag == 101 }.first?.isSelected = true
            case .phone:
                DoTypes.filter{ $0.tag == 102 }.first?.isSelected = true
            case .shop:
                DoTypes.filter{ $0.tag == 103 }.first?.isSelected = true
            case .air:
                DoTypes.filter{ $0.tag == 104 }.first?.isSelected = true
            }
            
            textField.text = data.todo.title
            datePick.date = data.todo.date
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var alert: UIAlertController = {
        let a = UIAlertController(title: "提示", message: "嘿！兄弟，你活动内容忘填了。", preferredStyle: .alert)
        let action = UIAlertAction(title: "好的", style: .default, handler: nil)
        a.addAction(action)
        return a
    }()
    
    @IBAction func doneAction(_ sender: UIBarButtonItem) {
        
        guard let todoText = textField.text, !todoText.isEmpty else {
            present(alert, animated: true, completion: nil)
            return
        }
        
        var type:ToDo.ToDoType
        let number = DoTypes.filter{ $0.isSelected }.first?.tag
        
        switch number ?? 0 {
        case 101:
            type = .talk
        case 102:
            type = .phone
        case 103:
            type = .shop
        case 104:
            type = .air
        default:
            fatalError("异常活动类型")
        }
        
        if let data = data {
            delegate?.editToDo(ToDo(icon: type, title: todoText, date: datePick.date), at: data.index)
        }else{
            delegate?.addNewToDo(ToDo(icon: type, title: todoText, date: datePick.date))
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectTypeAction(_ sender: UIButton) {
        DoTypes.forEach{ $0.isSelected = false }
        sender.isSelected = true
        
    }

    
    @IBAction func pickTouchAction(_ sender: UIDatePicker) {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
}


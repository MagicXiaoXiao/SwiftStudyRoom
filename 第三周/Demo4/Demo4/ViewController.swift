//
//  ViewController.swift
//  Demo4
//
//  Created by 漫不经心的魔导师 on 2017/11/2.
//  Copyright © 2017年 卡塞尔学院. All rights reserved.
//

import UIKit

protocol MeunListTapDelegate: NSObjectProtocol {
    func tapMeun(at index: Int, title meunTitle: String) -> Void
}

class ViewController: UIViewController {

    let meunList = ["列表1","列表2","列表3","列表4"]
    
    lazy var datas:[[String: Int]] = {
        return [["IMG_1":6],["IMG_2":10],["IMG_3":4],["IMG_4":15]]
    }()
    
    
    private var collectionViewController: CollectionViewController?
    private var tableViewController: TableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let tableVC = childViewControllers.first as? TableViewController,
            let collectionVC = childViewControllers.last as? CollectionViewController {
            tableViewController = tableVC
            collectionViewController = collectionVC
        }
        collectionViewController?.meunTitle = meunList.first
        collectionViewController?.data = datas.first
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MeunList",let tableVC = segue.destination as? TableViewController {
            tableVC.meunDelegate = self
            tableVC.datas = meunList
        }
    }
    
}

extension ViewController: MeunListTapDelegate {
    func tapMeun(at index: Int, title: String) {
        collectionViewController?.meunTitle = title
        collectionViewController?.data = datas[index]
    }
}





//
//  NavigtionPopDelegate.swift
//  Demo3
//
//  Created by 漫不经心的魔导师 on 2017/10/28.
//  Copyright © 2017年 卡塞尔学院. All rights reserved.
//

import UIKit

protocol NavigtionPopDelegate: NSObjectProtocol {
    
    func addNewToDo(_ todo: ToDo) -> Void
    
    func editToDo(_ todo: ToDo, at index: Int) -> Void
    
}


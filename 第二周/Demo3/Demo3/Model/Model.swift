//
//  Model.swift
//  Demo3
//
//  Created by 漫不经心的魔导师 on 2017/10/27.
//  Copyright © 2017年 卡塞尔学院. All rights reserved.
//

import Foundation
import UIKit

struct ToDo {
    
    enum ToDoType: String {
        case talk
        case phone
        case air
        case shop
    }
    
    var icon: ToDoType
    var title: String
    var date: Date
}

prefix operator ^*
prefix func ^*(right: String) -> Date {
    let fornatter = DateFormatter()
    fornatter.dateFormat = "yyyy-MM-dd"
    return fornatter.date(from: right) ?? Date()
}

prefix operator ^!
prefix func ^!(right: Date) -> String {
    let fornatter = DateFormatter()
    fornatter.dateFormat = "yyyy-MM-dd"
    return fornatter.string(from: right)
}

extension UITableViewCell {
    static let defaultReuseIdentifier = "ToDoCell"
}

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type,
                                                 withIdentifier identifier: String ,
                                                 cellStyle style: UITableViewCellStyle = .default,
                                                 for index: IndexPath) -> T {
        let cell = dequeueReusableCell(withIdentifier: identifier, for: index) as? T ?? T(style: style, reuseIdentifier: T.defaultReuseIdentifier)
        return cell
    }
}

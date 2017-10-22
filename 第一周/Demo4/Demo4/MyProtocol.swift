//
//  MyProtocol.swift
//  Demo4
//
//  Created by 陈晓波 on 2017/10/21.
//  Copyright © 2017年 漫不经心魔导师. All rights reserved.
//

import UIKit

protocol CellHeightDelegate: NSObjectProtocol {
    func updateHeight(indexPath: IndexPath, isShow: Bool) -> Void
}


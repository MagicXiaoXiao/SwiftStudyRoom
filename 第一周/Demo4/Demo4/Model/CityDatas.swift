//
//  CityDatas.swift
//  Demo4
//
//  Created by 陈晓波 on 2017/10/21.
//  Copyright © 2017年 漫不经心魔导师. All rights reserved.
//

import UIKit

struct MyData {
    
    var name: String
    var isShow: Bool = false
    var datas:[MyData]?
    
    init(name: String, isShow:Bool = false, datas:[MyData]? = nil) {
        self.name = name
        self.isShow = isShow
        self.datas = datas
    }
    
}


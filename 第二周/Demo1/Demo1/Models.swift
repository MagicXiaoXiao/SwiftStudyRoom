//
//  Models.swift
//  Demo1
//
//  Created by 漫不经心的魔导师 on 2017/10/25.
//  Copyright © 2017年 卡塞尔学院. All rights reserved.
//

import Foundation

struct User: Codable {
    
    var avatar:String
    var name: String
    var mobile: String
    var email: String
    var notes: String
    
}

struct DefaultDatas: Codable {
    
    let friends:[User]
    let other:[User]
    
    static let json = """
    {
    "friends": [
        {
            "avatar": "avatar1",
            "name": "Jesse Sapir",
            "mobile": "26098642878",
            "email": "kcrkjhgfa@hotmail.com",
            "notes": "There are people you love, your hobbies, triumphs, successes, and happiness. There is so much more than stress and fear. Stress does not make you better and fear does not make you happier. Many women suffer from chronic stress because they let it happen."
        },
        {
            "avatar": "avatar2",
            "name": "Virginia Woolf",
            "mobile": "25660228794",
            "email": "uewhc@163.com",
            "notes": "There are people you love, your hobbies, triumphs, successes, and happiness. There is so much more than stress and fear. Stress does not make you better and fear does not make you happier. Many women suffer from chronic stress because they let it happen."
        },
        {
            "avatar": "avatar3",
            "name": "Buck Wilson",
            "mobile": "71017651480",
            "email": "grqjba@163.com",
            "notes": "There are people you love, your hobbies, triumphs, successes, and happiness. There is so much more than stress and fear. Stress does not make you better and fear does not make you happier. Many women suffer from chronic stress because they let it happen."
        }
    ],
    "other": [
        {
            "avatar": "avatar4",
            "name": "Quentin Mansfield",
            "mobile": "62468002182",
            "email": "mbhcbckseo@163.com",
            "notes": "There are people you love, your hobbies, triumphs, successes, and happiness. There is so much more than stress and fear. Stress does not make you better and fear does not make you happier. Many women suffer from chronic stress because they let it happen."
        },
        {
            "avatar": "avatar5",
            "name": "Denise Haggai",
            "mobile": "85178860774",
            "email": "vnbvaihek@163.com",
            "notes": "There are people you love, your hobbies, triumphs, successes, and happiness. There is so much more than stress and fear. Stress does not make you better and fear does not make you happier. Many women suffer from chronic stress because they let it happen."
        },
        {
            "avatar": "avatar6",
            "name": "Lance Jerome",
            "mobile": "55882786358",
            "email": "jgsotkqcnbtpl@163.com",
            "notes": "There are people you love, your hobbies, triumphs, successes, and happiness. There is so much more than stress and fear. Stress does not make you better and fear does not make you happier. Many women suffer from chronic stress because they let it happen."
        }
    ]
}
"""
    
}




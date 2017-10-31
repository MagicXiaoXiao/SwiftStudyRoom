//
//  CollectionViewCell.swift
//  Demo3
//
//  Created by 漫不经心的魔导师 on 2017/10/31.
//  Copyright © 2017年 卡塞尔学院. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        self.layer.shadowOpacity = 1
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}

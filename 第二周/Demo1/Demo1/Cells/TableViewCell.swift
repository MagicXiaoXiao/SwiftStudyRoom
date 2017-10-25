//
//  TableViewCell.swift
//  Demo1
//
//  Created by 漫不经心的魔导师 on 2017/10/25.
//  Copyright © 2017年 卡塞尔学院. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        avatarImageView.layer.cornerRadius = min(avatarImageView.bounds.width, avatarImageView.bounds.height) / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


//
//  TableViewCell.swift
//  Demo3
//
//  Created by 漫不经心的魔导师 on 2017/10/27.
//  Copyright © 2017年 卡塞尔学院. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(data:ToDo) -> Void {
        iconImageView.image = UIImage(named:data.icon.rawValue)
        titleLabel.text = data.title
        dateLabel.text = ^!data.date
    }

}


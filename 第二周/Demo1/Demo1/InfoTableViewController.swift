//
//  InfoTableViewController.swift
//  Demo1
//
//  Created by 漫不经心的魔导师 on 2017/10/25.
//  Copyright © 2017年 卡塞尔学院. All rights reserved.
//

import UIKit

class InfoTableViewController: UITableViewController {

    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        avatarImageView.layer.cornerRadius = min(avatarImageView.bounds.width, avatarImageView.bounds.height) / 2
        
        if let data = user {
            avatarImageView.image = UIImage(named: data.avatar)
            nickNameLabel.text = data.name
            
            mobileLabel.text = data.mobile.mobileFormat()
            emailLabel.text = data.email
            notesLabel.text = data.notes
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension String {
    
    func mobileFormat() -> String {
        guard self.count == 11 else {
            return self
        }
        var mobileText = self
        mobileText.insert("-", at: mobileText.prefix(8).endIndex)
        mobileText.insert("-", at: mobileText.prefix(4).endIndex)
        return mobileText
    }
    
}


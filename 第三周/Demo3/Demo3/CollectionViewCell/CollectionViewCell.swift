//
//  CollectionViewCell.swift
//  Demo3
//
//  Created by 漫不经心的魔导师 on 2017/10/31.
//  Copyright © 2017年 卡塞尔学院. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    typealias TapClosure = (Int, Bool)-> Void
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loveButton: UIButton!
    
    var index: Int!
    
    var loveAction: TapClosure?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        self.layer.shadowOpacity = 1
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize.zero
    }
    
    @IBAction func tapLoveAction(_ sender: UIButton) {

        if sender.isSelected {
            deSelectAnimate()
            loveAction?(index,false)
        }else{
            selectedAnimate()
            loveAction?(index,true)
        }
        
        
    }
    
    func setIsLove(_ isLove: Bool) -> Void {
        if isLove {
            selectedAnimate()
        }else{
            deSelectAnimate()
        }
    }
    
    private func selectedAnimate() -> Void {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.5, options: .allowUserInteraction, animations: {
            self.loveButton.isSelected = true
            self.loveButton.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) { finish in
            
        }
    }
    
    private func deSelectAnimate() -> Void {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.5, options: .allowUserInteraction, animations: {
            self.loveButton.transform = CGAffineTransform.identity
            
        }) { finish in
            self.loveButton.isSelected = false
        }
        
    }
    
    
}

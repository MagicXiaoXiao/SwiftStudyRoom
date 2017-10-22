//
//  TableSectionHeader.swift
//  Demo4
//
//  Created by 陈晓波 on 2017/10/21.
//  Copyright © 2017年 漫不经心魔导师. All rights reserved.
//

import UIKit

class TableSectionHeader: UITableViewHeaderFooterView {
    
    static let sectionHeight: CGFloat = 45
    
    typealias TapHandleClosure = () -> Void
    
    lazy var titleButton:UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Text", for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets.left = 15
        button.addTarget(self, action: #selector(TableSectionHeader.tapButtonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    var isShow = false
    
    var tapAction: TapHandleClosure?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .red
        addSubview(titleButton)
        //autolayout
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        titleButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        titleButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        titleButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapButtonAction(sender: UIButton) -> Void {
        if let tap = tapAction {
            tap()
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

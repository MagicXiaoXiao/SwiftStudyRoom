//
//  CollectionViewController.swift
//  Demo2
//
//  Created by 漫不经心的魔导师 on 2017/10/27.
//  Copyright © 2017年 卡塞尔学院. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ItemCell"

class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        if let imageView = cell.viewWithTag(101) as? UIImageView,
            let label = cell.viewWithTag(102) as? UILabel {
            imageView.image = UIImage(named: "IMG\(indexPath.row + 1)")
            label.text = "第\(indexPath.row + 1)张图片"
        }
    
        return cell
    }

}

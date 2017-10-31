//
//  CollectionViewCell.swift
//  Demo1
//
//  Created by 漫不经心的魔导师 on 2017/10/31.
//  Copyright © 2017年 卡塞尔学院. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var indexTag: Int!
    
    var datas: Int? {
        didSet{
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = (collectionView.bounds.width - (layout.minimumInteritemSpacing * 3 + layout.sectionInset.left + layout.sectionInset.right)) / 4
            let height = (collectionView.bounds.height - (layout.sectionInset.top + layout.sectionInset.bottom + layout.minimumLineSpacing)) / 2
            layout.itemSize = CGSize(width: width, height: height)
        }
    }
    
}

extension CollectionViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let data = datas else { return 0 }
        return data
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LabelCell", for: indexPath)
        if let label = cell.viewWithTag(101) as? UILabel {
            label.text = "\(indexTag * 8 + indexPath.row)"
        }
        
        return cell
    }
    
}

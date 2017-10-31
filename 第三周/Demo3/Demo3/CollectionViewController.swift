//
//  CollectionViewController.swift
//  Demo3
//
//  Created by 漫不经心的魔导师 on 2017/10/31.
//  Copyright © 2017年 卡塞尔学院. All rights reserved.
//

import UIKit
import AVFoundation

private let reuseIdentifier = "ItemCell"

class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let waterfallLayout = collectionView?.collectionViewLayout as? WaterfallLayout {
            waterfallLayout.delegate = self
            collectionView?.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        if let cell = cell as? CollectionViewCell {
            cell.imageView.image = UIImage(named: "IMG\(indexPath.row + 1)")
        }
        
        return cell
    }

}

extension CollectionViewController: WaterfallLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        
        guard let layout = collectionView.collectionViewLayout as? WaterfallLayout else { return 0 }
        
        let image = UIImage(named: "IMG\(indexPath.row + 1)")!
        
        let boundingRect = CGRect(origin: CGPoint.zero, size: CGSize(width: layout.cellWidth, height: CGFloat(MAXFLOAT)))
        let rect  = AVMakeRect(aspectRatio: image.size, insideRect: boundingRect)
        return rect.size.height
    }
    
}


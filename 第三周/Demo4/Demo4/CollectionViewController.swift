//
//  CollectionViewController.swift
//  Demo4
//
//  Created by 漫不经心的魔导师 on 2017/11/3.
//  Copyright © 2017年 卡塞尔学院. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ItemCell"

class CollectionViewController: UICollectionViewController {

    var meunTitle: String?
    
    var data: [String:Int]? {
        didSet{
            collectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let w_h = (collectionView!.bounds.width - (layout.sectionInset.left + layout.sectionInset.right + layout.minimumInteritemSpacing))/2
            layout.itemSize = CGSize(width: w_h, height: w_h * 1.3)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let data = data else { return 0 }
        return data.values.first ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        if let imageView = cell.viewWithTag(101) as? UIImageView,
            let data = data{
            imageView.image = UIImage(named: data.keys.first ?? "")
        }
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "TitleHeader", for: indexPath)
        
        if let label = header.viewWithTag(101) as? UILabel {
            label.text = meunTitle
        }
        
        return header
    }

}








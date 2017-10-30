//
//  ViewController.swift
//  Demo1
//
//  Created by 漫不经心的魔导师 on 2017/10/30.
//  Copyright © 2017年 卡塞尔学院. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let count = 35 //item数量
    
    private var datas:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionView.layoutIfNeeded()
            let spacing: CGFloat = 15
            layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
            layout.minimumInteritemSpacing = spacing
            layout.minimumLineSpacing = spacing
            let width = (collectionView.bounds.width - spacing * 5) / 4
            let height = (collectionView.bounds.height - spacing * 3) / 2
            layout.itemSize = CGSize(width: width, height: height)
        }

        let num = count / 8
        if num > 0 {
            for _ in 1...num {
                datas += [8]
            }
            let arrayInt = datas.reduce(0, { (a, b) -> Int in
                return a + b
            })
            datas += [count - arrayInt]
        }else{
            datas += [count]
        }
        pageControl.numberOfPages = datas.count
        pageControl.currentPage = 0
        collectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pageChangeValueAction(_ sender: UIPageControl) {
        
        collectionView.scrollRectToVisible(CGRect(origin: CGPoint(x: CGFloat(sender.currentPage) * collectionView.bounds.size.width, y: 0), size: collectionView.bounds.size), animated: true)
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if datas[section] % 8 != 0 {
            return datas[section] + (8 - datas[section] % 8)
        }
        return datas[section]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath)
        let itemCount = datas[indexPath.section]
        if indexPath.row + 1 <= itemCount {
            item.isHidden = false
            if let label = item.viewWithTag(101) as? UILabel {
                label.text = "\(indexPath.section * 8 + indexPath.row)"
            }
        }else {
            item.isHidden = true
        }
        
        return item
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
    }
    
}















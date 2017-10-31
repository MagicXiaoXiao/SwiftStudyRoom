//
//  WaterfallLayout.swift
//  Demo3
//
//  Created by 漫不经心的魔导师 on 2017/10/31.
//  Copyright © 2017年 卡塞尔学院. All rights reserved.
//

//参考网上案例自己再调整一番~
//参考链接：https://www.raywenderlich.com/164608/uicollectionview-custom-layout-tutorial-pinterest-2
//中文链接：http://www.cocoachina.com/ios/20150831/13247.html

import UIKit

protocol WaterfallLayoutDelegate: NSObjectProtocol {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
    
}

class WaterfallLayout: UICollectionViewFlowLayout {
    
    weak var delegate: WaterfallLayoutDelegate!
    
    private var numberOfColumns = 2
    private var cellPadding: CGFloat = 5
    
    var cellWidth: CGFloat {
        guard let collectionView = self.collectionView else { return 0 }
        let spacing = cellPadding * 4 + collectionView.contentInset.left + collectionView.contentInset.right
        return (collectionView.bounds.width - spacing)/2
    }
    
    private var cache:[UICollectionViewLayoutAttributes] = []
    
    private var contentHeight: CGFloat = 0
    private var contentWidth: CGFloat {
        guard let collectionView = self.collectionView else { return 0 }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        
        guard cache.isEmpty, let collectionView = self.collectionView else { return }
        
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset:[CGFloat] = []
        for column in 0..<numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        
        var column = 0
        var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            let photoHeight = delegate.collectionView(collectionView,heightForPhotoAtIndexPath: indexPath)
            let height = cellPadding + photoHeight
            let frame = CGRect(origin: CGPoint(x: xOffset[column], y: yOffset[column]), size: CGSize(width: columnWidth, height: height))
            let insetFrame = frame.insetBy(dx: cellPadding , dy: cellPadding)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            
            cache.append(attributes)
            
            contentHeight = max(contentHeight, frame.maxY)
            yOffset[column] = yOffset[column] + height
            
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cache {
            if attributes.frame.intersects(rect){
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
    
}

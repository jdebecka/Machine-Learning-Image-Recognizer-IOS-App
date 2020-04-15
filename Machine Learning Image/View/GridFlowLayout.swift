//
//  GridFlowLayout.swift
//  Machine Learning Image
//
//  Created by Julia Debecka on 15/04/2020.
//  Copyright © 2020 Julia Debecka. All rights reserved.
//

import UIKit

class GridFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    func setUp() {
        minimumLineSpacing = 1.0
        minimumInteritemSpacing = 1.0
        scrollDirection = .vertical
    }
    
    override var itemSize: CGSize{
        set{}
        get {
            let numberOfColumns: CGFloat = 3
            
            let itemWidth = (self.collectionView!.frame.width - (numberOfColumns - 1)) / numberOfColumns
            
            return CGSize(width: itemWidth, height: itemWidth)
        }
    }
}

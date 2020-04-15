//
//  ImageCollectionViewCell.swift
//  Machine Learning Image
//
//  Created by Julia Debecka on 15/04/2020.
//  Copyright © 2020 Julia Debecka. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    func configureCell(_ image: UIImage) {
        imageView.image = image
    }
    
}

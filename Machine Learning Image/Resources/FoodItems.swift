//
//  FoodItems.swift
//  Machine Learning Image
//
//  Created by Julia Debecka on 15/04/2020.
//  Copyright © 2020 Julia Debecka. All rights reserved.
//

import UIKit

var imageList: [UIImage] {
    var listImage: [UIImage] = []
    for i in 1...9 {
        listImage.append(UIImage(named: "\(i)")!)
    }
    return listImage
}
    





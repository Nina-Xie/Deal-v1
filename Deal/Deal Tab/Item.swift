//
//  Item.swift
//  Deal
//
//  Created by 谢静怡 on 4/26/19.
//  Copyright © 2019 Nina Xie. All rights reserved.
//

import UIKit
import Foundation

enum Category {
    case Others
}

enum Condition {
    case New
    case LikeNew
    case VeryGood
    case Good
    case Acceptable
}


class Item {
    let itemName: String
    let itemPrice: Double
    let userName: String
    let descriptionText: String
    let imageSet: [UIImage]
    var isLiked: Bool = false
    
    init (name: String, price: Double, user: String, description: String, images: [UIImage]) {
        itemName = name
        itemPrice = price
        userName = user
        descriptionText = description
        imageSet = images
    }
}

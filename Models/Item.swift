//
//  Item.swift
//  Deal
//
//  Created by Nina Xie on 4/26/19.
//  Copyright © 2019 F(X). All rights reserved.
//

import UIKit
import Foundation

// ************* Hard Code *************
class Item {
    let itemName: String
    let itemPrice: Double
    let userName: String  // TODO: seller: User
    let descriptionText: String
    let imageSet: [UIImage]
    var isLiked: Bool = false
    var isBought: Bool = false
    var isSold: Bool = false
    var isCompleted: Bool = false
    
    init (name: String, price: Double, user: String, description: String, images: [UIImage]) {
        itemName = name
        itemPrice = price
        userName = user
        descriptionText = description
        imageSet = images
    }
}

// ************* Codable *************

//struct Item: Codable {
//    var itemName: String
//    var itemPrice: Double
//    var userName: String
//    var descriptionText: String
//    var imageSet: [UIImage]
//    var isLiked: Bool = false
//
//}


//
//  ItemCollectionViewCell.swift
//  Deal
//
//  Created by 谢静怡 on 4/26/19.
//  Copyright © 2019 Nina Xie. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    var itemImage: UIImageView!
    var nameLabel: UILabel!
    var priceLabel: UILabel!
    var userLabel: UILabel!
    
    let imageHeight: CGFloat = 180
    let padding: CGFloat = 8
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        itemImage = UIImageView(frame: .zero)
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        itemImage.contentMode = .scaleAspectFit
        contentView.addSubview(itemImage)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        contentView.addSubview(nameLabel)
        
        priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.systemFont(ofSize: 18)
        contentView.addSubview(priceLabel)
        
        userLabel = UILabel()
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.font = UIFont.systemFont(ofSize: 16)
        contentView.addSubview(userLabel)
        
        setupConstrainst()
    }
    
    func setupConstrainst() {
        NSLayoutConstraint.activate([
            itemImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemImage.heightAnchor.constraint(equalToConstant: imageHeight)
            ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: itemImage.bottomAnchor, constant: padding),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1*padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            ])
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1*padding),
            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            ])
        
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: padding),
            userLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            userLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1*padding),
            userLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
    }
    
    func configure(for item: Item) {
        itemImage.image = item.imageSet[0]
        nameLabel.text = item.itemName
        priceLabel.text = "$ \(item.itemPrice)"
        userLabel.text = item.userName
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

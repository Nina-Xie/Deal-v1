//
//  ImageCollectionViewCell.swift
//  Deal
//
//  Created by 谢静怡 on 4/26/19.
//  Copyright © 2019 Nina Xie. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    var imageSetDetailView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageSetDetailView = UIImageView(frame: .zero)
        imageSetDetailView.translatesAutoresizingMaskIntoConstraints = false
        imageSetDetailView.contentMode = .scaleAspectFit
        contentView.addSubview(imageSetDetailView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageSetDetailView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageSetDetailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageSetDetailView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageSetDetailView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }
    
    func configure(for image: UIImage) {
        imageSetDetailView.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

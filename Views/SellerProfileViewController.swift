//
//  SellerProfileViewController.swift
//  Deal
//
//  Created by Feng Yichen on 2019/5/3.
//  Copyright © 2019 F(X). All rights reserved.
//

import UIKit

class SellerProfileViewController: UIViewController {
    
    var sellerImageView: UIImageView!
    var sellerNameLabel: UILabel!
    var sellerDescriptionTextView: UITextView!
    var onSaleButton: UIButton!
    
    var redRec: UIView!
    var whiteRec: UIView!
    let padding: CGFloat = 18
    let radius: CGFloat = 8
    var buttonWidth: CGFloat!
    let lightGrey = UIColor(named: "LightGrey")
    let red = UIColor(named: "Red")
    
    var sellerUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = lightGrey
        sellerUser = DealAPI.getUser()
        buttonWidth = (view.frame.width - padding*2)/2
        
        redRec = UIView()
        redRec.translatesAutoresizingMaskIntoConstraints = false
        redRec.backgroundColor = red
        redRec.layer.shadowColor = UIColor.lightGray.cgColor
        redRec.layer.shadowOffset = CGSize(width: 2.5,height: 2.5)
        redRec.layer.shadowRadius = 5
        redRec.layer.shadowOpacity = 0.8
        view.addSubview(redRec)
        
        sellerImageView = UIImageView()
        sellerImageView.translatesAutoresizingMaskIntoConstraints = false
        sellerImageView.image = sellerUser.profileImage
        sellerImageView.contentMode = .scaleAspectFit
        sellerImageView.clipsToBounds = true
        view.addSubview(sellerImageView)
        
        sellerNameLabel = UILabel()
        sellerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        sellerNameLabel.textColor = .white
        sellerNameLabel.textAlignment = .left
        sellerNameLabel.text = sellerUser.userName
        sellerNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        view.addSubview(sellerNameLabel)
        
        sellerDescriptionTextView = UITextView()
        sellerDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        sellerDescriptionTextView.text = sellerUser.personalInformation
        sellerDescriptionTextView.isEditable = false
        sellerDescriptionTextView.isScrollEnabled = true
        sellerDescriptionTextView.font = UIFont.systemFont(ofSize: 18)
        sellerDescriptionTextView.backgroundColor = .white
        sellerDescriptionTextView.textColor = .black
        sellerDescriptionTextView.layer.cornerRadius = radius
        view.addSubview(sellerDescriptionTextView)
        
        whiteRec = UIView()
        whiteRec.translatesAutoresizingMaskIntoConstraints = false
        whiteRec.backgroundColor = .white
        whiteRec.layer.cornerRadius = radius
        whiteRec.layer.shadowColor = UIColor.lightGray.cgColor
        whiteRec.layer.shadowOffset = CGSize(width: 2.5,height: 2.5)
        whiteRec.layer.shadowRadius = 5
        whiteRec.layer.shadowOpacity = 0.8
        view.addSubview(whiteRec)
        
        onSaleButton = UIButton()
        onSaleButton.setTitle("On Sale", for: .normal)
        onSaleButton.setTitleColor(red, for: .normal)
        onSaleButton.translatesAutoresizingMaskIntoConstraints = false
        onSaleButton.addTarget(self, action: #selector(pushOnSaleItemsViewController), for: .touchUpInside)
        view.addSubview(onSaleButton)
        
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            redRec.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            redRec.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            redRec.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            redRec.heightAnchor.constraint(equalToConstant:175)
            ])
        
        NSLayoutConstraint.activate([
            sellerImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            sellerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            sellerImageView.heightAnchor.constraint(equalToConstant: 90),
            sellerImageView.widthAnchor.constraint(equalToConstant: 90)
            ])
        
        NSLayoutConstraint.activate([
            sellerNameLabel.centerYAnchor.constraint(equalTo: sellerImageView.centerYAnchor),
            sellerNameLabel.leadingAnchor.constraint(equalTo: sellerImageView.trailingAnchor, constant: padding),
            sellerNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1*padding)
            ])
        
        NSLayoutConstraint.activate([
            sellerDescriptionTextView.topAnchor.constraint(equalTo: sellerImageView.bottomAnchor, constant: padding),
            sellerDescriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            sellerDescriptionTextView.heightAnchor.constraint(equalToConstant: 180),
            sellerDescriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            whiteRec.topAnchor.constraint(equalTo: sellerDescriptionTextView.bottomAnchor, constant: 2*padding),
            whiteRec.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            whiteRec.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            whiteRec.heightAnchor.constraint(equalToConstant: buttonWidth/2)
            ])
        
        NSLayoutConstraint.activate([
            onSaleButton.topAnchor.constraint(equalTo: whiteRec.topAnchor),
            onSaleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            onSaleButton.heightAnchor.constraint(equalToConstant: buttonWidth/2),
            onSaleButton.widthAnchor.constraint(equalToConstant: buttonWidth)
            ])
        
        
    }
    
    
    @objc func pushOnSaleItemsViewController(_ target: UIButton) {
        
        let onSaleItemsViewController = ItemsOnProfileViewController()
        onSaleItemsViewController.title = "On Sale"
        self.navigationController?.pushViewController(onSaleItemsViewController, animated: true)
            
        // Change title from being default back button text
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationItem.backBarButtonItem = backButton
        
        
    }
    
    
}



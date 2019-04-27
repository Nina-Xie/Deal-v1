//
//  ViewController.swift
//  Deal
//
//  Created by 谢静怡 on 4/25/19.
//  Copyright © 2019 Nina Xie. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    var userImageView: UIImageView!
    var userNameLabel: UILabel!
    var userPersonalInformation: UITextView!
    var onSaleButton: UIButton!
    var soldButton: UIButton!
    var boughtButton: UIButton!
    var signOutButton: UIButton!
    let padding: CGFloat = 10
    let buttonHeight: CGFloat = 80
    
    let userLoggedin = DealAPI.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        userImageView = UIImageView()
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.clipsToBounds = true
        userImageView.contentMode = .scaleAspectFit
        userImageView.image = userLoggedin.profileImage
        view.addSubview(userImageView)
        
        userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.font = .systemFont(ofSize: 24)
        userNameLabel.numberOfLines = 1
        userNameLabel.textColor = .black
        userNameLabel.textAlignment = .left
        userNameLabel.text = userLoggedin.userName
        view.addSubview(userNameLabel)
        
        userPersonalInformation = UITextView()
        userPersonalInformation.translatesAutoresizingMaskIntoConstraints = false
        userPersonalInformation.text = "Tell us something about you"
        userPersonalInformation.isEditable = true
        userPersonalInformation.font = UIFont.systemFont(ofSize: 16)
        userPersonalInformation.backgroundColor = .white
        userPersonalInformation.textColor = .black
        userPersonalInformation.layer.borderColor = UIColor.gray.cgColor
        userPersonalInformation.layer.borderWidth = 2
        userPersonalInformation.layer.cornerRadius = 12
        view.addSubview(userPersonalInformation)
        
        onSaleButton = UIButton()
        onSaleButton.setTitle("On Sale", for: .normal)
        onSaleButton.setTitleColor(.blue, for: .normal)
        onSaleButton.translatesAutoresizingMaskIntoConstraints = false
        onSaleButton.addTarget(self, action: #selector(pushOnSaleItemsViewController), for: .touchUpInside)
        onSaleButton.backgroundColor = .white
        onSaleButton.layer.borderColor = UIColor.gray.cgColor
        onSaleButton.layer.borderWidth = 2
        onSaleButton.layer.cornerRadius = 12
        view.addSubview(onSaleButton)
        
        soldButton = UIButton()
        soldButton.setTitle("Sold", for: .normal)
        soldButton.setTitleColor(.blue, for: .normal)
        soldButton.translatesAutoresizingMaskIntoConstraints = false
        soldButton.addTarget(self, action: #selector(pushSoldItemsViewController), for: .touchUpInside)
        soldButton.backgroundColor = .white
        soldButton.layer.borderColor = UIColor.gray.cgColor
        soldButton.layer.borderWidth = 2
        soldButton.layer.cornerRadius = 12
        view.addSubview(soldButton)
        
        boughtButton = UIButton()
        boughtButton.setTitle("Bought", for: .normal)
        boughtButton.setTitleColor(.blue, for: .normal)
        boughtButton.translatesAutoresizingMaskIntoConstraints = false
        boughtButton.addTarget(self, action: #selector(pushBoughtItemsViewController), for: .touchUpInside)
        boughtButton.backgroundColor = .white
        boughtButton.layer.borderColor = UIColor.gray.cgColor
        boughtButton.layer.borderWidth = 2
        boughtButton.layer.cornerRadius = 12
        view.addSubview(boughtButton)
        
        signOutButton = UIButton()
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.setTitleColor(.blue, for: .normal)
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
//        signOutButton.addTarget(self, action: #selector(returnToLaunchScreen), for: .touchUpInside)
        signOutButton.backgroundColor = .white
        signOutButton.layer.borderColor = UIColor.gray.cgColor
        signOutButton.layer.borderWidth = 2
        signOutButton.layer.cornerRadius = 12
        view.addSubview(signOutButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            userImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            userImageView.heightAnchor.constraint(equalToConstant: 90),
            userImageView.widthAnchor.constraint(equalToConstant: 90)
            ])
        
        NSLayoutConstraint.activate([
            userNameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 2*padding),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1*padding)
            ])
        
        NSLayoutConstraint.activate([
            userPersonalInformation.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: padding),
            userPersonalInformation.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            userPersonalInformation.heightAnchor.constraint(equalToConstant: 180),
            userPersonalInformation.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            onSaleButton.topAnchor.constraint(equalTo: userPersonalInformation.bottomAnchor, constant: padding*2),
            onSaleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            onSaleButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            onSaleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            soldButton.topAnchor.constraint(equalTo: onSaleButton.bottomAnchor, constant: padding),
            soldButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            soldButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            soldButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            boughtButton.topAnchor.constraint(equalTo: soldButton.bottomAnchor, constant: padding),
            boughtButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            boughtButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            boughtButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            signOutButton.topAnchor.constraint(equalTo: boughtButton.bottomAnchor, constant: padding*10),
            signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signOutButton.heightAnchor.constraint(equalToConstant: buttonHeight/2),
            signOutButton.widthAnchor.constraint(equalToConstant: 120)
            ])
    }
    
    
    @objc func pushOnSaleItemsViewController(_ target: UIButton) {
        
        let onSaleItemsViewController = ItemsOnProfileViewController()
        
        onSaleItemsViewController.title = "On Sale"
        navigationController?.pushViewController(onSaleItemsViewController, animated: true)
        
        
        // Change title from being default back button text
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        navigationItem.backBarButtonItem = backButton
        
    }
    
    @objc func pushSoldItemsViewController(_ target: UIButton) {
        
        let soldItemsViewController = ItemsOnProfileViewController()
        
        soldItemsViewController.title = "Sold"
        navigationController?.pushViewController(soldItemsViewController, animated: true)
        
        
        // Change title from being default back button text
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        navigationItem.backBarButtonItem = backButton
        
    }
    
    @objc func pushBoughtItemsViewController(_ target: UIButton) {
        
        let boughtItemsViewController = ItemsOnProfileViewController()
        
        boughtItemsViewController.title = "Bought"
        navigationController?.pushViewController(boughtItemsViewController, animated: true)
        
        
        // Change title from being default back button text
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        navigationItem.backBarButtonItem = backButton
        
    }
    
    
    
}

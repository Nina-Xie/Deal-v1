//
//  ItemDetailNavgationViewController.swift
//  Deal
//
//  Created by 谢静怡 on 4/26/19.
//  Copyright © 2019 Nina Xie. All rights reserved.
//

import UIKit
import GoogleSignIn

class ItemDetailNavgationViewController: UIViewController {
    var thisItem: Item
    
    var nameDetailLabel: UILabel!
    var priceDetailLabel: UILabel!
    var sellerDetailButton: UIButton!
    var descriptionDetailView: UITextView!
    var imageSetDetailCollectionView: UICollectionView!
    var toolBar: UIToolbar!
    //    var categoryDetailLabel: UILabel!
    //    var conditionDetailLabel: UILabel!
    
    let imageCellReuseIdentifier = "imageCellReuseIdentifier"
    let padding: CGFloat = 24
    let radius: CGFloat = 8
    let lightGrey = UIColor(named: "LightGrey")
    let red = UIColor(named: "Red")

    
    init(item: Item) {
        thisItem = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = lightGrey
        
        nameDetailLabel = UILabel()
        nameDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        nameDetailLabel.text = thisItem.itemName
        nameDetailLabel.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        nameDetailLabel.textAlignment = .left
        view.addSubview(nameDetailLabel)
        
        priceDetailLabel = UILabel()
        priceDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        priceDetailLabel.text = "$ \(thisItem.itemPrice)"
        priceDetailLabel.font = UIFont.systemFont(ofSize: 22)
        priceDetailLabel.textColor = red
        view.addSubview(priceDetailLabel)
        
        sellerDetailButton = UIButton()
        sellerDetailButton.translatesAutoresizingMaskIntoConstraints = false
        sellerDetailButton.setTitle(thisItem.userName, for: .normal)
        sellerDetailButton.setTitleColor(.gray, for: .normal)
        sellerDetailButton.title
        sellerDetailButton.addTarget(self, action: #selector(lookAtThisSeller), for: .touchUpInside)
        view.addSubview(sellerDetailButton)
        
        //        categoryDetailLabel = UILabel()
        //        categoryDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        //        categoryDetailLabel.text = "Category: " // for testing
        //        categoryDetailLabel.font = UIFont.systemFont(ofSize: 20)
        //        view.addSubview(categoryDetailLabel)
        //
        //        conditionDetailLabel = UILabel()
        //        conditionDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        //        conditionDetailLabel.text = "Condition: " // for testing
        //        conditionDetailLabel.font = UIFont.systemFont(ofSize: 20)
        //        view.addSubview(conditionDetailLabel)
        
        descriptionDetailView = UITextView()
        descriptionDetailView.translatesAutoresizingMaskIntoConstraints = false
        descriptionDetailView.text = thisItem.descriptionText
        descriptionDetailView.font = UIFont.systemFont(ofSize: 18)
        descriptionDetailView.isEditable = false
        descriptionDetailView.isScrollEnabled = true
        descriptionDetailView.backgroundColor = .white
        descriptionDetailView.layer.cornerRadius = radius
        descriptionDetailView.layer.shadowColor = UIColor.lightGray.cgColor
        descriptionDetailView.layer.shadowOffset = CGSize(width: 2.5,height: 2.5)
        descriptionDetailView.layer.shadowRadius = 5
        descriptionDetailView.layer.shadowOpacity = 0.8
        view.addSubview(descriptionDetailView)
        
        
        let imageCollectionViewFlowLayout = UICollectionViewFlowLayout()
        imageCollectionViewFlowLayout.scrollDirection = .horizontal
        imageCollectionViewFlowLayout.minimumInteritemSpacing = padding
        imageCollectionViewFlowLayout.minimumLineSpacing = padding
        
        imageSetDetailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: imageCollectionViewFlowLayout)
        imageSetDetailCollectionView.translatesAutoresizingMaskIntoConstraints = false
        imageSetDetailCollectionView.backgroundColor = .white
        imageSetDetailCollectionView.layer.cornerRadius = radius
        imageSetDetailCollectionView.layer.shadowColor = UIColor.lightGray.cgColor
        imageSetDetailCollectionView.layer.shadowOffset = CGSize(width: 2.5,height: 2.5)
        imageSetDetailCollectionView.layer.shadowRadius = 5
        imageSetDetailCollectionView.layer.shadowOpacity = 0.8
        
        imageSetDetailCollectionView.delegate = self
        imageSetDetailCollectionView.dataSource = self
        imageSetDetailCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: imageCellReuseIdentifier)
        view.addSubview(imageSetDetailCollectionView)
        
        
        toolBar = UIToolbar()
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        let likeBarItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: #selector(likeItem))
        toggleHeart(for: likeBarItem)
        
        let commentBarItem = UIBarButtonItem(image: UIImage(named: "Comment"), style: .plain, target: self, action: #selector(pushCommentViewController))
        
//        let wantBarItem = UIBarButtonItem(title: "Want It", style: .plain, target: self, action: nil)
//        wantBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 21)], for: .normal)
//
//        let gotBarItem = UIBarButtonItem(title: "Got It", style: .plain, target: self, action: nil)
//        gotBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 21)], for: .normal)
//
//        let soldBarItem = UIBarButtonItem(title: "Sold", style: .plain, target: self, action: nil)
//        soldBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 21)], for: .normal)
        
        let removeBarItem = UIBarButtonItem(title: "Remove", style: .plain, target: self, action: nil)
        removeBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 21)], for: .normal)
            
        toolBar.items = [likeBarItem, commentBarItem, removeBarItem]
        toolBar.tintColor = red
        view.addSubview(toolBar)
        
        // compareUserAndSeller()
        removeBarItem.tintColor = .lightGray
        removeBarItem.isEnabled = false
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameDetailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18),
            nameDetailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            nameDetailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1*padding),
            nameDetailLabel.heightAnchor.constraint(equalToConstant: 35)
            ])
        
        NSLayoutConstraint.activate([
            priceDetailLabel.topAnchor.constraint(equalTo: nameDetailLabel.bottomAnchor, constant: padding),
            priceDetailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            priceDetailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1*padding),
            priceDetailLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            sellerDetailButton.topAnchor.constraint(equalTo: priceDetailLabel.bottomAnchor, constant: 18),
            sellerDetailButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
//            sellerDetailButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1*padding),
            sellerDetailButton.heightAnchor.constraint(equalToConstant: 20)
            ])
  
        NSLayoutConstraint.activate([
            descriptionDetailView.topAnchor.constraint(equalTo: sellerDetailButton.bottomAnchor, constant: padding),
            descriptionDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            descriptionDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1*padding),
            descriptionDetailView.heightAnchor.constraint(equalToConstant: 180)
            ])
        
        NSLayoutConstraint.activate([
            imageSetDetailCollectionView.topAnchor.constraint(equalTo: descriptionDetailView.bottomAnchor, constant: padding),
            imageSetDetailCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            imageSetDetailCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            imageSetDetailCollectionView.bottomAnchor.constraint(equalTo: toolBar.topAnchor, constant: -1*padding)
            ])
        
        NSLayoutConstraint.activate([
            toolBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            toolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolBar.heightAnchor.constraint(equalToConstant: 49)
            ])
    }
    
//    // compare the current user and the item seller, and change tool bar items color/enabled
//    func compareUserAndSeller() {
//        let sellerId = thisItem.userGoogleId
//        let userId = GIDSignIn.sharedInstance()?.currentUser.authentication.idToken
//        if sellerId != userId {
//            let remove = self.toolbarItems![2]
//            remove.tintColor = .lightGray
//            remove.isEnabled = false
//        } else {
//            let like = self.toolbarItems![0]
//            like.tintColor = .lightGray
//            like.isEnabled = false
//            let comment = self.toolbarItems![1]
//            comment.tintColor = .lightGray
//            comment.isEnabled = false
//        }
//    }
    
    @objc func lookAtThisSeller(_target: UIButton) {
        let sellerProfileViewController = SellerProfileViewController() 
        navigationController?.pushViewController(sellerProfileViewController, animated: true)
    }
    
    @objc func likeItem(_ target: UIBarButtonItem) {
        thisItem.isLiked.toggle()
        toggleHeart(for: target)
        //TODO add to Favorite item list
        
    }
    
    @objc func pushCommentViewController(_ target: UIBarButtonItem) {
        
        let commentViewController = CommentViewController()
        navigationController?.pushViewController(commentViewController, animated: true)
        
        let backButton = UIBarButtonItem()
        backButton.title = nameDetailLabel.text
        navigationItem.backBarButtonItem = backButton
        
    }
    
    func toggleHeart(for barButton: UIBarButtonItem){
        if thisItem.isLiked == false {
            barButton.image = UIImage(named: "Heart")
        } else {
            barButton.image = UIImage(named: "Heart_full")
        }
    }
    
}

extension ItemDetailNavgationViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thisItem.imageSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: imageCellReuseIdentifier, for: indexPath) as! ImageCollectionViewCell
        let image = thisItem.imageSet[indexPath.item]
        imageCell.configure(for: image)
        return imageCell
    }
    
}

extension ItemDetailNavgationViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

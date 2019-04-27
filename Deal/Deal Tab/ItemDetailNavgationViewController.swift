//
//  ItemDetailNavgationViewController.swift
//  Deal
//
//  Created by 谢静怡 on 4/26/19.
//  Copyright © 2019 Nina Xie. All rights reserved.
//

import UIKit

class ItemDetailNavgationViewController: UIViewController {
    var nameText: String
    var priceText: Double
    var userText: String
    var descriptionText: String
    var imageSetDetail: [UIImage]
//    var categoryText:
//    var conditionText:
    
    var nameDetailLabel: UILabel!
    var priceDetailLabel: UILabel!
    var userDetailLabel: UILabel!
    var categoryDetailLabel: UILabel!
    var conditionDetailLabel: UILabel!
    var descriptionDetailView: UITextView!
    var imageSetDetailCollectionView: UICollectionView!
    var toolBar: UIToolbar!
    
    let imageCellReuseIdentifier = "imageCellReuseIdentifier"
    let padding: CGFloat = 8
    
    init(nameDetail: String, priceDetail: Double, userDetail: String, descriptionDetail: String, imageDetail: [UIImage]) {
        nameText = nameDetail
        priceText = priceDetail
        userText = userDetail
        descriptionText = descriptionDetail
        imageSetDetail = imageDetail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        title = "Detail"
        view.backgroundColor = .white
        
        nameDetailLabel = UILabel()
        nameDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        nameDetailLabel.text = nameText
        nameDetailLabel.font = UIFont.systemFont(ofSize: 24)
        nameDetailLabel.textAlignment = .center
        view.addSubview(nameDetailLabel)
        
        priceDetailLabel = UILabel()
        priceDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        priceDetailLabel.text = "$ \(priceText)"
        priceDetailLabel.font = UIFont.systemFont(ofSize: 22)
        view.addSubview(priceDetailLabel)
        
        userDetailLabel = UILabel()
        userDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        userDetailLabel.text = userText
        userDetailLabel.font = UIFont.systemFont(ofSize: 20)
        userDetailLabel.textAlignment = .right
        view.addSubview(userDetailLabel)
        
        categoryDetailLabel = UILabel()
        categoryDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryDetailLabel.text = "Category: " // for testing
        categoryDetailLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(categoryDetailLabel)
        
        conditionDetailLabel = UILabel()
        conditionDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        conditionDetailLabel.text = "Condition: " // for testing
        conditionDetailLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(conditionDetailLabel)
        
        descriptionDetailView = UITextView()
        descriptionDetailView.translatesAutoresizingMaskIntoConstraints = false
        descriptionDetailView.text = descriptionText
        descriptionDetailView.font = UIFont.systemFont(ofSize: 16)
        descriptionDetailView.isEditable = false
        descriptionDetailView.isScrollEnabled = true
        descriptionDetailView.backgroundColor = .clear
//        descriptionDetailView.layer.borderColor = UIColor.lightGray.cgColor
//        descriptionDetailView.layer.borderWidth = 2
        view.addSubview(descriptionDetailView)
        
        let imageCollectionViewFlowLayout = UICollectionViewFlowLayout()
        imageCollectionViewFlowLayout.scrollDirection = .horizontal
        imageCollectionViewFlowLayout.minimumInteritemSpacing = padding
        imageCollectionViewFlowLayout.minimumLineSpacing = padding
        
        imageSetDetailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: imageCollectionViewFlowLayout)
        imageSetDetailCollectionView.translatesAutoresizingMaskIntoConstraints = false
        imageSetDetailCollectionView.backgroundColor = .clear
        imageSetDetailCollectionView.delegate = self
        imageSetDetailCollectionView.dataSource = self
        imageSetDetailCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: imageCellReuseIdentifier)
        view.addSubview(imageSetDetailCollectionView)
        
        toolBar = UIToolbar()
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        let likeBarItem = UIBarButtonItem(title: "Like", style: .plain, target: self, action: nil)
        let commentBarItem = UIBarButtonItem(title: "Comment", style: .plain, target: self, action: nil)
        let chatBarItem = UIBarButtonItem(title: "Chat", style: .plain, target: self, action: nil)
        toolBar.items = [likeBarItem, commentBarItem, chatBarItem]
        view.addSubview(toolBar)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameDetailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            nameDetailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            nameDetailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1*padding),
            nameDetailLabel.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            priceDetailLabel.topAnchor.constraint(equalTo: nameDetailLabel.bottomAnchor, constant: padding),
            priceDetailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            priceDetailLabel.heightAnchor.constraint(equalToConstant: 25),
            priceDetailLabel.widthAnchor.constraint(equalToConstant: (view.frame.width - 3*padding)/2)
            ])
        
        NSLayoutConstraint.activate([
            userDetailLabel.topAnchor.constraint(equalTo: nameDetailLabel.bottomAnchor, constant: padding),
            userDetailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1*padding),
            userDetailLabel.heightAnchor.constraint(equalToConstant: 25),
            userDetailLabel.widthAnchor.constraint(equalToConstant: (view.frame.width - 3*padding)/2)
            ])
        
        NSLayoutConstraint.activate([
            categoryDetailLabel.topAnchor.constraint(equalTo: priceDetailLabel.bottomAnchor, constant: padding),
            categoryDetailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            categoryDetailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1*padding),
            categoryDetailLabel.heightAnchor.constraint(equalToConstant: 25),
            ])
        
        NSLayoutConstraint.activate([
            conditionDetailLabel.topAnchor.constraint(equalTo: categoryDetailLabel.bottomAnchor, constant: padding),
            conditionDetailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            conditionDetailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1*padding),
            conditionDetailLabel.heightAnchor.constraint(equalToConstant: 25),
            ])
        
        NSLayoutConstraint.activate([
            descriptionDetailView.topAnchor.constraint(equalTo: conditionDetailLabel.bottomAnchor, constant: 2*padding),
            descriptionDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            descriptionDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1*padding),
            descriptionDetailView.heightAnchor.constraint(equalToConstant: 180)
            ])
        
        NSLayoutConstraint.activate([
            imageSetDetailCollectionView.topAnchor.constraint(equalTo: descriptionDetailView.bottomAnchor, constant: padding),
            imageSetDetailCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            imageSetDetailCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1*padding),
            imageSetDetailCollectionView.bottomAnchor.constraint(equalTo: toolBar.topAnchor, constant: -1*padding)
            ])
        
        NSLayoutConstraint.activate([
            toolBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            toolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolBar.heightAnchor.constraint(equalToConstant: 49)
            ])
    }
    

}

extension ItemDetailNavgationViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageSetDetail.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: imageCellReuseIdentifier, for: indexPath) as! ImageCollectionViewCell
        let image = imageSetDetail[indexPath.item]
        imageCell.configure(for: image)
        return imageCell
    }
    
    
}

extension ItemDetailNavgationViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

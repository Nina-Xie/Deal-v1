//
//  ViewController.swift
//  Deal
//
//  Created by 谢静怡 on 4/25/19.
//  Copyright © 2019 Nina Xie. All rights reserved.
//

import UIKit

class DealViewController: UIViewController {

    var searchBar: UISearchBar!
    var itemCollectionView: UICollectionView!
    
    var items: [Item] = []
    
    let padding: CGFloat = 10
    let itemCellReuseIdentifier = "itemCellReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "Deal"
        view.backgroundColor = .white
        
        items = DealAPI.getItems()
        
        // searchBar
        searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
//        searchBar.delegate = self
        view.addSubview(searchBar)
        
        // itemCollectionView
        let itemCollectionViewFlowLayout = UICollectionViewFlowLayout()
        itemCollectionViewFlowLayout.scrollDirection = .vertical
        itemCollectionViewFlowLayout.minimumInteritemSpacing = padding
        itemCollectionViewFlowLayout.minimumLineSpacing = padding
        
        itemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: itemCollectionViewFlowLayout)
        itemCollectionView.translatesAutoresizingMaskIntoConstraints = false
        itemCollectionView.backgroundColor = .clear
        itemCollectionView.delegate = self
        itemCollectionView.dataSource = self
        itemCollectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: itemCellReuseIdentifier)
        view.addSubview(itemCollectionView)
        
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchBar.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            itemCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: padding),
            itemCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            itemCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1*padding),
            itemCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -1*padding),
            ])
    }
    
}

extension DealViewController:  UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == itemCollectionView {
            return items.count
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == itemCollectionView {
            let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: itemCellReuseIdentifier, for: indexPath) as! ItemCollectionViewCell
            let item = items[indexPath.item]
            itemCell.configure(for: item)
        
            itemCell.layer.borderColor = UIColor.lightGray.cgColor
            itemCell.layer.borderWidth = 2
            itemCell.layer.cornerRadius = 12
//            itemCell.layer.shadowColor = UIColor.lightGray.cgColor
//            itemCell.layer.shadowOffset = CGSize(width: 1.0,height: 2.0)
//            itemCell.layer.shadowRadius = 2.0
//            itemCell.layer.shadowOpacity = 1.0
//            itemCell.layer.masksToBounds = false;
//            itemCell.layer.shadowPath = UIBezierPath(roundedRect:itemCell.bounds, cornerRadius:itemCell.contentView.layer.cornerRadius).cgPath
        
            return itemCell
//        }
    }
    
}

extension DealViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemSelected = items[indexPath.item]
        
        let itemDealView = ItemDetailNavgationViewController(nameDetail: itemSelected.itemName, priceDetail: itemSelected.itemPrice, userDetail: itemSelected.userName, descriptionDetail: itemSelected.descriptionText, imageDetail: itemSelected.imageSet)
        navigationController?.pushViewController(itemDealView, animated: true)
    }
}

extension DealViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if (collectionView == ItemCollectionView) {
            let width = (collectionView.frame.width - padding)/2
            return CGSize(width: width, height: width+80)
//        }
    }
}

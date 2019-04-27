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
    
    let padding: CGFloat = 10
    let itemCellReuseIdentifier = "itemCellReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Deal"
        view.backgroundColor = .white
        
        // searchBar
        searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        view.addSubview(searchBar)
        
        // itemCollectionView
        let itemCollectionViewFlowLayout = UICollectionViewFlowLayout()
        itemCollectionViewFlowLayout.scrollDirection = .vertical
        itemCollectionViewFlowLayout.minimumInteritemSpacing = padding
        itemCollectionViewFlowLayout.minimumLineSpacing = padding
        
        itemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: itemCollectionViewFlowLayout)
        itemCollectionView.translatesAutoresizingMaskIntoConstraints = false
        itemCollectionView.backgroundColor = .lightGray
//        itemCollectionView.delegate = self
//        itemCollectionView.dataSource = self
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

extension DealViewController: UISearchBarDelegate {
    
}

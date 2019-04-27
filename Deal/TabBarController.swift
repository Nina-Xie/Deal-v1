//
//  TabBarController.swift
//  Deal
//
//  Created by 谢静怡 on 4/25/19.
//  Copyright © 2019 Nina Xie. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let VC1 = DealViewController()
        VC1.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Home"), tag: 0)
        
        let VC2 = FavoriteViewController()
        VC2.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Favorite"), tag: 1)
        
        let VC3 = PostViewController()
        VC3.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Post"), tag: 2)
        
        let VC4 = MessageViewController()
        VC4.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Message"), tag: 3)
        
        let VC5 = UserViewController()
        VC5.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "User"), tag: 4)
        
        
        let tabBarList = [VC1, VC2, VC3, VC4, VC5]
        viewControllers = tabBarList
        selectedIndex = 0
        
        title = "Deal"
        delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if selectedIndex == 2 {
            title = nil
            let postController = UINavigationController(rootViewController: PostViewController())
            self.present(postController, animated: true, completion: {
                self.selectedIndex = 0
                self.title = self.selectedViewController?.navigationItem.title
            })
        } else {
            title = selectedViewController?.navigationItem.title
        }
    }
}

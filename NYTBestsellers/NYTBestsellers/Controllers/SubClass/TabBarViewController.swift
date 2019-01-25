//
//  TabBarViewController.swift
//  NYTBestsellers
//
//  Created by Biron Su on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bestSellerVC = BestSellerViewController()
        bestSellerVC.tabBarItem = UITabBarItem(title: "Best Sellers", image: UIImage(named: "bestSellers"), tag: 0)
        
        let favoriteVC = FavoriteViewController()
        favoriteVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "favorites"), tag: 1)
        
        let settingsVC = SettingsViewController()
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings"), tag: 2)
                
        let tabBarLists = [bestSellerVC, favoriteVC, settingsVC]
        viewControllers = tabBarLists.map(UINavigationController.init)
        
        
    }
    
}

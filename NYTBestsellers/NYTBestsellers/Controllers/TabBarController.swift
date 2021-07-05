//
//  TabBarController.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bestSellerViewController = BestSellersViewController()
        bestSellerViewController.tabBarItem = UITabBarItem(title: "Best Sellers", image: UIImage(named: "medal30"), tag: 0)
        
        let favoritesViewController = FavoritesViewController()
        favoritesViewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "bookmark30"), tag: 1)
        
        let settingsViewController = SettingsViewController()
        settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings30"), tag: 2)
        
        
        let tabBarList = [UINavigationController(rootViewController: bestSellerViewController),
                          UINavigationController(rootViewController: favoritesViewController),
                          UINavigationController(rootViewController: settingsViewController)]
        
        viewControllers = tabBarList

        
    }
    


}

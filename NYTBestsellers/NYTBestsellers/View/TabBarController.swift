//
//  TabBarController.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bestSellerViewController = BestSellersViewController()
        bestSellerViewController.tabBarItem = UITabBarItem(title: "Best Sellers", image: UIImage(named: "books"), tag: 0)
        let favoritesViewController = SavedBooksViewController()
        favoritesViewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "favorites"), tag: 1)
        let settingsViewController = SettingsViewController()
        settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings"), tag: 2)
        let tabBarList = [bestSellerViewController, favoritesViewController, settingsViewController]
        viewControllers = tabBarList
    }

}

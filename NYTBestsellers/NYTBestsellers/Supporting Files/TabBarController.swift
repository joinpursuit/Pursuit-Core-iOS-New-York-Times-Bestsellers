//
//  TabBarController.swift
//  NYTBestsellers
//
//  Created by Kevin Waring on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstViewController = BestSellersViewController()
        
        firstViewController.tabBarItem = UITabBarItem(title:"Best Sellers", image: UIImage(named: "medal30"), tag: 0)
        
        let secondViewController = FavoritesViewController()
        
        secondViewController.tabBarItem = UITabBarItem(title:"Favorites", image: UIImage(named: "bookmark30"), tag: 0)
        
        let thirdViewController = SettingsViewController()
        
        thirdViewController.tabBarItem = UITabBarItem(title:"Settings", image: UIImage(named: "settings30"), tag: 0)
        
        
        
        let tabBarList = [UINavigationController(rootViewController: firstViewController),UINavigationController(rootViewController: secondViewController),UINavigationController(rootViewController: thirdViewController)]
        
        viewControllers = tabBarList
    }
    

    

}

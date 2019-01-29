//
//  TabViewController.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTabBar()
  }
  
  private func setupTabBar() {
    
    
    let bestSellerControllerTab = NYTBestSellerController()
    
    
    bestSellerControllerTab.tabBarItem = UITabBarItem(title: "Best Sellers", image: UIImage(named: "bestSeller"), tag: 0)
    
    bestSellerControllerTab.title = "NYT Best Sellers"
    
    let favoriteTab = FavoritesController()
    favoriteTab.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "favoritesFolder"), tag: 1)
    
    let settingsTab = SettingsController()
    settingsTab.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings"), tag: 2)
    
    let tabBarList = [UINavigationController(rootViewController: bestSellerControllerTab),
                      UINavigationController(rootViewController: favoriteTab),
                      UINavigationController(rootViewController: settingsTab)]
    
    viewControllers = tabBarList
    
    
    
    
    
  }
  
  
  
}

//
//  BestSellerTabBar.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerTabBar: UITabBarController {
  let firstButton: UITabBarItem = {
    let firstButton  = UITabBarItem()
    firstButton.image = #imageLiteral(resourceName: "icons8-book-filled-25.png")
    return firstButton
  }()
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
      let bestSeller = BestSellerViewController()
      let navController = UINavigationController()
      navController.viewControllers = [bestSeller]
      let settings = SettingsViewController()
      let favorites = FavoritesViewController()
    viewControllers = [navController,favorites,settings]
    
    }
  

  

}

//
//  BestSellerTabBar.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerTabBar: UITabBarController {
  
  let bestSeller = BestSellerViewController()
  let navController = UINavigationController()
  let secondNav = UINavigationController()
  let settings = SettingsViewController()
  let favorites = FavoritesViewController()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    
    getCategories()
    favorites.tabBarItem.title = "Favorites"
    bestSeller.tabBarItem.title = "BestSellers"
    settings.tabBarItem.title = "Settings"
    favorites.tabBarItem.image = #imageLiteral(resourceName: "icons8-star-filled-25 (1).png")
    bestSeller.tabBarItem.image = #imageLiteral(resourceName: "icons8-book-filled-25.png")
    settings.tabBarItem.image = #imageLiteral(resourceName: "icons8-settings-25.png")
    secondNav.viewControllers = [settings]
    navController.viewControllers = [bestSeller]
    viewControllers = [navController,favorites,secondNav]
    
  }
  func getCategories(){
    BookShelfApiClient.getCategoryDetails { (error, categories) in
      if let error = error {
        print(error.errorMessage())
      }
      if let categories = categories {
        self.bestSeller.categories = categories
        self.settings.categories = categories
      }
    }
  }
  
  
}

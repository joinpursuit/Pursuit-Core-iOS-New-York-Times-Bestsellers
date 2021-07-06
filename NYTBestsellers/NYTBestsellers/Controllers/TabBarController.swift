//
//  TabBarController.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    var bestSellersNavVC = UINavigationController.init(rootViewController: BestSellersViewController())
    var favoritesNavVC = UINavigationController.init(rootViewController: FavoritesViewController())
    var settingsNavVC = UINavigationController.init(rootViewController: SettingsViewController())
    var amazonNavVC = UINavigationController.init(rootViewController: AmazonViewController())
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bestSellersNavVC.tabBarItem = UITabBarItem(title: "Bestsellers", image: UIImage(named: "nytimesLogo"), tag: 0)
        favoritesNavVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "favRibbon"), tag: 1)
        settingsNavVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settingIcon"), tag: 2)
        setViewControllers([bestSellersNavVC,favoritesNavVC,settingsNavVC], animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

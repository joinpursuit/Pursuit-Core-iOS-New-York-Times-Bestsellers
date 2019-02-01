//
//  AppDelegate.swift
//  NYTBestsellers
//
//  Created by Alex Paul on 1/24/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let NYTB = NYTBestsellersViewController()
    let FVC = FavoritesViewController()
    let SVC = SettingsViewController()
    let tab = UITabBarController()
    let nav = UINavigationController.init(rootViewController: NYTB)
    let nav2 = UINavigationController.init(rootViewController: FVC)
    let nav3 = UINavigationController.init(rootViewController: SVC)
    nav.tabBarItem = UITabBarItem(title: "Best Sellers", image: UIImage.init(named: "icons8-best-seller-filled-25"), selectedImage: UIImage.init(named: "icons8-best-seller-filled-25"))
    nav2.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage.init(named: "icons8-heart-filled-25"), selectedImage: UIImage.init(named: "icons8-heart-filled-25"))
    nav3.tabBarItem = UITabBarItem(title: "Setting", image: UIImage.init(named: "icons8-settings-filled-25"), selectedImage: UIImage.init(named: "icons8-settings-filled-25"))
    tab.viewControllers = [nav, nav2, nav3]
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController =  tab
    window?.makeKeyAndVisible()
        return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}


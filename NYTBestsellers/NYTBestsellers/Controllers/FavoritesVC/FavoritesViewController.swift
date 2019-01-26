//
//  FavoriitesViewController.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

  let favoriteView = FavoritesView()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = #colorLiteral(red: 0.7817301154, green: 0.7033625245, blue: 1, alpha: 1)
      favoriteView.favoriteCollectionView.dataSource = self
      favoriteView.favoriteCollectionView.delegate = self
      self.view.addSubview(favoriteView)
      title = "Favorites"
     
    }
    

  

}

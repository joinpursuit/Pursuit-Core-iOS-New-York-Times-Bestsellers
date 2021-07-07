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
  var favItem: NewBookCodable!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.8111895323, green: 0.6748743653, blue: 0.6124779582, alpha: 1)
    favoriteView.favoriteCollectionView.dataSource = self
    favoriteView.favoriteCollectionView.delegate = self
    self.view.addSubview(favoriteView)
    
    title = "Favorites"
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    self.favoriteView.favoriteCollectionView.reloadData()
  }
  
  
}
extension FavoritesViewController:FavoritesCollectionViewCellDelegate{
  func deleteFromFaves(index: Int) {
    PersistanceHelper.deleteItemsFromDirectory(newBook: favItem, index: index)
    self.favoriteView.favoriteCollectionView.reloadData()
  }
  
  func presentAlertController(alertController: UIAlertController) {
    self.present(alertController, animated: true, completion: nil)
  }
  
  
  
}

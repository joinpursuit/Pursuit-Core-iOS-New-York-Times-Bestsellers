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
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    self.favoriteView.favoriteCollectionView.reloadData()
  }
  

}
extension FavoritesViewController:FavoritesCollectionViewCellDelegate{
  func presentAlertController() {
    let alertController = UIAlertController(title: "More Options", message: "What would you like to do?", preferredStyle: .actionSheet)
    let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (delete) in
      
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    let seeOnAmazon = UIAlertAction(title: "See on Amazon", style: .default) { (amazon) in
      print("amazon")
    }
    alertController.addAction(deleteAction)
    alertController.addAction(seeOnAmazon)
    alertController.addAction(cancelAction)
    self.present(alertController, animated: true, completion: nil)
  }
  
  
}

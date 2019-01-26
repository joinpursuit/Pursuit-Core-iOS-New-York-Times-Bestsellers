//
//  FavoritesController.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesController: UIViewController {
  
  let favoriteBooksView = FavoriteViews()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Favorites"
    view.backgroundColor = .blue
    
    self.view.addSubview(favoriteBooksView)
    
    
    self.favoriteBooksView.favoritesCollectionView.register(FavoritesCollectionCell.self, forCellWithReuseIdentifier: "FavoritesCollectionCell")
    
    favoriteBooksView.favoritesCollectionView.dataSource = self
  }
  
}

extension FavoritesController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = favoriteBooksView.favoritesCollectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCollectionCell", for: indexPath) as? FavoritesCollectionCell else {return UICollectionViewCell()}
    cell.backgroundColor = .white
    return cell
  }
  
  
}




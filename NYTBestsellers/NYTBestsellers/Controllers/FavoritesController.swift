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
  
  var favoriteBookArray = [FavoriteBook](){
    didSet {
      DispatchQueue.main.async {
        self.favoriteBooksView.favoritesCollectionView.reloadData()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Favorites"
    view.backgroundColor = .blue
    self.view.addSubview(favoriteBooksView)
    
    self.favoriteBooksView.favoritesCollectionView.register(FavoritesCollectionCell.self, forCellWithReuseIdentifier: "FavoritesCollectionCell")
    
    setBookFromModel()
    
    favoriteBooksView.favoritesCollectionView.dataSource = self
    favoriteBooksView.favoritesCollectionView.delegate = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    setBookFromModel()
    self.favoriteBooksView.favoritesCollectionView.reloadData()
  }
  
  func setBookFromModel() {
    self.favoriteBookArray = FavoritesDataManager.getFavoriteBooksInfo()
  }
}


extension FavoritesController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return favoriteBookArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = favoriteBooksView.favoritesCollectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCollectionCell", for: indexPath) as? FavoritesCollectionCell else {return UICollectionViewCell()}
    let currentBook = favoriteBookArray[indexPath.row]
    
    cell.bookDescription.text = currentBook.bookDescription
    cell.weeksLabel.text = "\(currentBook.weeksOnBestSellerList) weeks on the NYT Best Seller List"
    if let imageToSet = currentBook.imageData {
     cell.imageCover.image = UIImage(data: imageToSet)
    } else {
     cell.imageCover.image = UIImage(named: "book")
    }
    
   cell.backgroundColor = .white
    return cell
  }
  
  
}




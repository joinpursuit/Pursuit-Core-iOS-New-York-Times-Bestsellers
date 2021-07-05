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
    self.favoriteBooksView.favoritesCollectionView.reloadData()
  }
}


extension FavoritesController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return favoriteBookArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = favoriteBooksView.favoritesCollectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCollectionCell", for: indexPath) as? FavoritesCollectionCell else {return UICollectionViewCell()}
    let currentBook = favoriteBookArray[indexPath.row]
    
    cell.moreActions.tag = indexPath.row
    
    cell.moreActions.addTarget(self, action: #selector(actionButtonPressed(_:)), for: .touchUpInside)
    
    
    //    cell.delegate = self
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
  
  @objc func actionButtonPressed(_ sender: UIButton) {
    
    
    
    let index = sender.tag
    
    let  actionSheet = UIAlertController(title: "More Actions", message: "Choose an option", preferredStyle: .actionSheet)
    
    
    let delete = UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive, handler: { (delete) in
      
      FavoritesDataManager.delete(atIndex: index)
      self.setBookFromModel()
      
    })
    
    let amazon = UIAlertAction(title: "See on Amazon", style: UIAlertAction.Style.default, handler: { (linkToAmazon) in
      
    })
    
    let cancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { (cancel) in
      self.dismiss(animated: true, completion: nil)
    })
    
    actionSheet.addAction(delete)
    actionSheet.addAction(cancel)
    actionSheet.addAction(amazon)
    
    present(actionSheet, animated: true)
  }
  
}





//
//  CollectionViewExt.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
extension BestSellerViewController:UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return books.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = bestSellerView.bestSellersCollectionView.dequeueReusableCell(withReuseIdentifier: "bestSeller", for: indexPath) as? BestSellerCollectionViewCell else {return UICollectionViewCell()}
    let book = books[indexPath.row]
    let isbn = book.book_details[indexPath.section].primary_isbn13
    self.getBookCoverInfo(isbn: isbn)
        DispatchQueue.main.async {
       cell.infoLabel.text = book.book_details[indexPath.section].title
    }
 

    return cell
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
self.navigationController?.pushViewController(BestSellerDetailledViewController(), animated: true)
}
}







extension BestSellerViewController:UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize.init(width: 200, height: 248)
  }
}

extension FavoritesViewController:UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = favoriteView.favoriteCollectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCell", for: indexPath) as? FavoritesCollectionViewCell else {return UICollectionViewCell()}
    
    return cell
  }
  
  
}
extension FavoritesViewController:UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize.init(width: 400, height: 400)
  }
}

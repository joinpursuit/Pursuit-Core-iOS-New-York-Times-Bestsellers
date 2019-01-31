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
    
    BookShelfApiClient.getBookCoverInfo(isbn: isbn) { (error, googleBookInfo) in
      if let error = error {
        print(error.errorMessage())
      }
      if let googleBookInfo = googleBookInfo {
        DispatchQueue.main.async {
          self.configureBookCover(imageURL: googleBookInfo.imageLinks.smallThumbnail, cell: cell)
        }
      }
    }
    
    cell.infoLabel.text = book.book_details[indexPath.section].title
    cell.bookCoverImageView.image = UIImage(named: "placeholder")
    cell.descriptiontextView.text = book.book_details[indexPath.section].description
    
    return cell
  }
  
  private func configureBookCover(imageURL: URL, cell: BestSellerCollectionViewCell) {
    if let image = ImageHelper.fetchImageFromCache(urlString: imageURL.absoluteString) {
      cell.bookCoverImageView.image = image

    } else {
      ImageHelper.fetchImageFromNetwork(urlString: imageURL.absoluteString) { (appError, image) in
        if let appError = appError {
          print(appError.errorMessage())
        } else if let image = image {
          cell.bookCoverImageView.image = image
         
        }
      }
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let cell = collectionView.cellForItem(at: indexPath) as? BestSellerCollectionViewCell else {
      print("no cell blah blah")
      return
    }
    
    let book = books[indexPath.row]
    let bestSeller = BestSellerDetailledViewController()
    
     newBook = NewBook.init(authorName: book.book_details[indexPath.section].author, description: cell.descriptiontextView.text, bookName: book.book_details[indexPath.section].title, bookCover: cell.bookCoverImageView.image, imageData: nil)
          
    bestSeller.newBook = newBook
    self.navigationController?.pushViewController(bestSeller, animated: true)
  }
}







extension BestSellerViewController:UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize.init(width: 300, height: 405)
  }
}

extension FavoritesViewController:UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return PersistanceHelper.getFavBooks().count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = favoriteView.favoriteCollectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCell", for: indexPath) as? FavoritesCollectionViewCell else {return UICollectionViewCell()}
      let book = PersistanceHelper.getFavBooks()[indexPath.row]
    cell.infoLabel.text = book.authorName
    cell.DescriptiontextView.text = book.description
    cell.bookCoverImageView.image = UIImage(data: book.imageData!)
    cell.delegate = self
  
    return cell
  }
  
  
}
extension FavoritesViewController:UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize.init(width: 400, height: 400)
  }
}

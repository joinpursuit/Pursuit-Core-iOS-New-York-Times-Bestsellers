//
//  BestSellerViewController.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerViewController: UIViewController {
  
  var categories = [CategoryInfo](){
    didSet{
      DispatchQueue.main.async {
self.bestSellerView.categoryPickerView.reloadAllComponents()
      }
    }
  }

var books = [Results](){
    didSet{
      DispatchQueue.main.async {
self.bestSellerView.bestSellersCollectionView.reloadData()
      }
    }
  }
  
  var selectedCategory = "" {
    didSet{
      DispatchQueue.main.async {
 // self.bestSellerView.bestSellersCollectionView.reloadData()
      }
    }
  }
  let bestSellerView = BestSellerView()
 
  var bookCover = [VolumeInfo]() {
    didSet{
      DispatchQueue.main.async {
self.bestSellerView.bestSellersCollectionView.reloadData()
      }
    }
  }
  var bookDescription = "" {
    didSet{
      print("I got set description")
    }
  }
  var urlThumbnails: URL?
  
  override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = #colorLiteral(red: 1, green: 0.6699612737, blue: 0.8998487592, alpha: 1)
    
      self.view.addSubview(bestSellerView)
     bestSellerView.bestSellersCollectionView.delegate = self
      bestSellerView.bestSellersCollectionView.dataSource = self
      bestSellerView.categoryPickerView.dataSource = self
    bestSellerView.categoryPickerView.delegate = self
      getCategories()
   title = "BestSellers"
     
  }
  
  private func getCategories(){
    BookShelfApiClient.getCategoryDetails { (error, categories) in
      if let error = error {
        print(error.errorMessage())
      }
      if let categories = categories {
        self.categories = categories
      }
    }
  }
  
  public func getBooks(category:String){
    BookShelfApiClient.getBooksInCategory(category: category) { (error, books) in
      if let error = error {
        print(error.errorMessage())
      }
      if let books = books {
        self.books = books
        dump(books)
      }
    }
}
  public func getBookCoverInfo(isbn:String){
    BookShelfApiClient.getBookCoverInfo(isbn: isbn) { (error, imageURL) in
      if let error = error {
        print(error.errorMessage())
      }
      if let imageURL = imageURL {
        self.urlThumbnails = imageURL
       
      }
    }
  }
  func getImageCoverImage(imageUrl:URL) -> UIImage? {
    ImageHelper.fetchImageFromNetwork(urlString: imageUrl.absoluteString) { (error, image) in
      if let error = error {
        
      }
      if let image = image {
        
      }
    }
    return UIImage()
}
}

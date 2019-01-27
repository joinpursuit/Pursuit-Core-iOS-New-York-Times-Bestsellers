//
//  NYTBestSellerControllerViewController.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTBestSellerController: UIViewController {
  
  let bestSellerView = BestSellerView()
  
  var categoriesInfo = [BookCategories]() {
    didSet {
      DispatchQueue.main.async {
        self.bestSellerView.categoryPickerView.reloadAllComponents()
      }
    }
  }
  
  var bookInfoForCollectionView = [BookGeneralInfo]() {
    didSet {
      DispatchQueue.main.async {
        self.bestSellerView.bestSellerCollectionView.reloadData()
      }
    }
  }
  
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    view.backgroundColor = .white
    navigationItem.title = "Best Sellers"
    
    self.view.addSubview(bestSellerView)
    
    self.bestSellerView.bestSellerCollectionView.register(BestSellerCollectionCell.self, forCellWithReuseIdentifier: "BestCollectionCell")
    
    bestSellerView.bestSellerCollectionView.dataSource = self
    bestSellerView.categoryPickerView.delegate =  self
    bestSellerView.categoryPickerView.dataSource = self
    
    getCategories()
    //TODO I'll wrap this up TO CALL user defaults
    getBookInfo(categoryName: "Manga")
    
  }
  
  func getCategories(){
    CategoriesAPICLient.getCategoriesData { (appError, categories) in
      if let appError = appError {
        print(appError.errorMessage())
      }
      if let arrayOfCategoryName = categories {
        self.categoriesInfo = arrayOfCategoryName
        dump(self.categoriesInfo)
      }
    }
  }
  
  func getBookInfo(categoryName: String) {
    BooksAPIClient.getBookData(category: categoryName) { (appError, bookData) in
      if let appError = appError {
        print(appError.errorMessage())
      }
      if let bookData = bookData {
        self.bookInfoForCollectionView = bookData
        dump(self.bookInfoForCollectionView)
      }
    }
  }
  
}

extension NYTBestSellerController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return bookInfoForCollectionView.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = bestSellerView.bestSellerCollectionView.dequeueReusableCell(withReuseIdentifier: "BestCollectionCell", for: indexPath) as? BestSellerCollectionCell else {return UICollectionViewCell()}
    cell.backgroundColor = .white
    let currentBook = bookInfoForCollectionView[indexPath.row]
    cell.bookDescription.text = currentBook.book_details[0].description
    cell.weeksLabel.text = "\(currentBook.weeks_on_list)"
    return cell
  }
  
  
}

extension NYTBestSellerController: UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return categoriesInfo.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return categoriesInfo[row].list_name
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    let categoryName = categoriesInfo[row].list_name
    
    getBookInfo(categoryName: categoryName)
  }
  
  
}




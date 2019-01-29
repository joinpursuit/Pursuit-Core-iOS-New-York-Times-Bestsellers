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
  
  public var imageToSegue = UIImage()
  
  public var descriptionFromGoogle = String()
  
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
    bestSellerView.bestSellerCollectionView.delegate = self
    bestSellerView.categoryPickerView.delegate =  self
    bestSellerView.categoryPickerView.dataSource = self
    
    
//    let fetchedCategories = CategoriesDataManager.fetchCategories()
//    if fetchedCategories.count == 0 {
//      getCategories()
//    }
    getCategories()
    //TODO I'll wrap this up TO CALL user defaults
    getBookInfo(categoryName:"")
    
  }
  
  func getCategories(){
    CategoriesAPICLient.getCategoriesData { (appError, categories) in
      if let appError = appError {
        print(appError.errorMessage())
      }
      if let arrayOfCategoryName = categories {
        self.categoriesInfo = arrayOfCategoryName
//        dump(self.categoriesInfo)
        //save into FileMa
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
    cell.weeksLabel.text = "\(currentBook.weeks_on_list) weeks on the NYT Best Sellers List"
    
    
    let isbn = currentBook.book_details[0].primary_isbn13
    
    ImagesAPIClient.getBookImages(isbn: isbn) { (appError, image) in
      if let appError = appError {
        print(appError)
      }
      if let data = image {
        
        let imageToSet = data[0].volumeInfo.imageLinks.thumbnail
      
        //Taking advatange of this call to get the long description for the detailed view.
        self.descriptionFromGoogle = data[0].volumeInfo.description
        
        DispatchQueue.main.async {
          if let image = ImageHelper.fetchImageFromCache(urlString: imageToSet){
            DispatchQueue.main.async {
              cell.imageCover.image = image
            }
          } else{
            ImageHelper.fetchImageFromNetwork(urlString: imageToSet, completion: { (appError, image) in
              if let appError = appError {
                print(appError)
                cell.imageCover.image = UIImage(named: "book")
              }
              if let image = image{
                cell.imageCover.image = image
              }
            })
          }
        }
      }
    }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let bookToSegue = bookInfoForCollectionView[indexPath.row]
    
    guard let cell = collectionView.cellForItem(at: indexPath) as? BestSellerCollectionCell else {
      print("didSelectItemAt cell nil")
      return
    }
    let detailedVC = BookDetailsController()
    detailedVC.bookInDetail = bookToSegue
    detailedVC.imageForDetailed = cell.imageCover.image
    detailedVC.descriptionFromGoodle = descriptionFromGoogle
    navigationController?.pushViewController(detailedVC, animated: true)
    
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
    return categoriesInfo[row].listName
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    let categoryName = categoriesInfo[row].listName
    
    getBookInfo(categoryName: categoryName)
  }
  
  
}




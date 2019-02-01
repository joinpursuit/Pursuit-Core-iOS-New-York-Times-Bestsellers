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
  var keyword = ""
  var theRow = Int()
 var descriptions = ""
  let bestSellerView = BestSellerView()
  var newBook:NewBook?
  var bookCover:URL?
  
  var bookDescription = "" {
    didSet{
      print("I got set description")
    }
  }

  override func viewDidLoad() {
        super.viewDidLoad()
      self.view.addSubview(bestSellerView)
     view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    delegatesAndDatasources()
    if let row = UserDefaults.standard.object(forKey: UserDefaultsKeys.row) as? Int{
      if let category = UserDefaults.standard.object(forKey: UserDefaultsKeys.chosenCateogry) as? String{
        theRow = row
        keyword = category
        getBooks(category: keyword)
      }
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    userDefaults()
  }
  private func userDefaults(){
  if let component = UserDefaults.standard.object(forKey: UserDefaultsKeys.row) as? Int {
    bestSellerView.categoryPickerView.selectRow(component, inComponent: 0, animated: true)
    DispatchQueue.main.async {
      guard self.categories.count > 0 else {return}
      self.getBooks(category: self.categories[component].list_name)
    }
    }
  }
  
 private func delegatesAndDatasources(){
    bestSellerView.bestSellersCollectionView.delegate = self
    bestSellerView.bestSellersCollectionView.dataSource = self
    bestSellerView.categoryPickerView.dataSource = self
    bestSellerView.categoryPickerView.delegate = self
  }
  
  public func getBooks(category:String){
    BookShelfApiClient.getBooksInCategory(category: category) { (error, books) in
      if let error = error {
        print(error.errorMessage())
      }
      if let books = books {
        self.books = books
   
      }
    }
}
  
}


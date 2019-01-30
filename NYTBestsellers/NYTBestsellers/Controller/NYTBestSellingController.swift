//
//  NYTBestSellingController.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTBestSellingController: UIViewController {
    
    let nYTBestSellingView = NYTBestSellingView()
    
    var allBookCategories = [Category]() {
        didSet {
            DispatchQueue.main.async {
                self.nYTBestSellingView.categoryPickerView.reloadAllComponents()
            }
        }
    }
    
    var nYTBestSellers = [NYTBook]() {
        didSet {
            DispatchQueue.main.async {
                self.nYTBestSellingView.bestsellersCollectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(nYTBestSellingView)
        nYTBestSellingView.delegate = self
        initialSetup()
    }
    
    private func initialSetup() {
        getAllCategories()
        searchNYTBestSellersByCategory(category: "animals")
    }
    
    private func getAllCategories() {
        NYTBestsellingCategoriesAPIClient.getAllCategories { (appError, categories) in
            if let appError = appError {
                print(appError.errorMessage())
                self.showAlert(title: "\(appError)", message: "\(appError.errorMessage())")
            } else if let categories = categories {
                self.allBookCategories = categories.sorted { $0.displayName < $1.displayName }
            }
        }
    }
    
    private func searchNYTBestSellersByCategory(category: String) {
        NYTBestsellingBooksAPIClient.getAllBooks(category: category) { (appError, nYTBooks) in
            if let appError = appError {
                print(appError.errorMessage())
                self.showAlert(title: "\(appError)", message: "\(appError.errorMessage())")
            } else if let nYTBooks = nYTBooks {
                self.nYTBestSellers = nYTBooks
            }
        }
    }
    
}

extension NYTBestSellingController: NYTBestSellingViewDelegate {
    func configureUICollectionCell(indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = nYTBestSellingView.bestsellersCollectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as? BookCell else { return UICollectionViewCell() }
        
        let currentBook = nYTBestSellers[indexPath.row]
        cell.configureCell(nYTBook: currentBook)
        return cell
    }
    
    func numberOfNYTBooks() -> Int {
        return nYTBestSellers.count
    }
    
    func numberOfCategories() -> Int {
        return allBookCategories.count
    }
    
    func setTitleOfPickerView(rowNum: Int) -> String {
        let currentCategory = allBookCategories[rowNum]
        return currentCategory.displayName
    }
    
}

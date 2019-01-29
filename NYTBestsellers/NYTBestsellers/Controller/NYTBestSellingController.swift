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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(nYTBestSellingView)
        nYTBestSellingView.delegate = self
        getAllCategories()
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
    
}

extension NYTBestSellingController: NYTBestSellingViewDelegate {
    
    func numberOfCategories() -> Int {
        return allBookCategories.count
    }
    
    func setTitleOfPickerView(rowNum: Int) -> String {
        let currentCategory = allBookCategories[rowNum]
        return currentCategory.displayName
    }
    
}

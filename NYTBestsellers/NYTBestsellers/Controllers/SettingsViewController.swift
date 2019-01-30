//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

struct CategoryList: Codable {
    let listName: Category
}

class SettingsViewController: UIViewController {
//    private let fileName = "BestSellersCategories.plist"
    let settingsView = SettingsView()
    var categories = [Category]() {
        didSet{
            DispatchQueue.main.async {
                self.settingsView.settingsPickerViewObj.reloadAllComponents()
            }
        }
    }
    
    override func viewDidLoad() {
        self.title = "Settings"
        view.addSubview(settingsView)
        settingsView.settingsPickerViewObj.dataSource = self
        settingsView.settingsPickerViewObj.delegate =  self
        let fetchedCategories = CategoryDataManager.fetchCategoriesFromDocumentsDirectory()
        if fetchedCategories.count == 0 {
            fetchCategoriesFromDocumentsDirectory()
        }
        categories = fetchedCategories
    }
    
    
    func fetchCategoriesFromDocumentsDirectory(){
        NewYorkBestSellerApiClient.searchForBestSellingBooks { (appError, onlineBooks) in
            if let appError = appError {
                print(appError.errorMessage())
            }
            if let onlineBooks = onlineBooks {
                self.categories = onlineBooks
        CategoryDataManager.saveCategoriesToDocumentsDirectory(categories: onlineBooks)
            }
        }
    }
}

extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row].listName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       let savedSelection = categories[row].listName
        UserDefaults.standard.set(savedSelection, forKey: DefaultKeys.key)
    }
    
}

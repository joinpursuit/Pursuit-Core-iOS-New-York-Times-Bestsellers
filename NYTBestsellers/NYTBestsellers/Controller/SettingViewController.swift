//
//  SettingViewController.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    let settingView = SettingView()
    
    var defaultCategoryName = "manga"
    var allBookCategories = [Category]() {
        didSet {
            let rowNum = allBookCategories.firstIndex { $0.listNameEncoded == defaultCategoryName }
            DispatchQueue.main.async {
                self.settingView.categoryPickerView.reloadAllComponents()
                self.settingView.categoryPickerView.selectRow(rowNum ?? 0, inComponent: 0, animated: false)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(settingView)
        settingView.categoryPickerView.delegate = self
        settingView.categoryPickerView.dataSource = self
        checkUserDefaults()
        fetchAllCategories()
    }
    
    private func checkUserDefaults() {
        if let defaultCategoryName = UserDefaults.standard.object(forKey: UserDefaultsKeys.defaultCategory) as? String {
            self.defaultCategoryName = defaultCategoryName
        } 
    }
    
    private func fetchAllCategories() {
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


extension SettingViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return allBookCategories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return allBookCategories[row].displayName
    }
}

extension SettingViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let categoryName = allBookCategories[row].listNameEncoded
        UserDefaults.standard.set(categoryName, forKey: UserDefaultsKeys.defaultCategory)
    }
}

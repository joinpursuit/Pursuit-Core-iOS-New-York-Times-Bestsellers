//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let settingsView = SettingsView()
    private var settingsCategories = [CategoryResults](){
        didSet { //use case ex. when searching
            //tableview reload data needs to be on the main thread
            DispatchQueue.main.async {
                self.settingsView.mySettingsPickerView.reloadAllComponents()
            }
        }
    }

    let defaultCategory = "travel"
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title =
            "Pick Default Category"
        view.addSubview(settingsView)
        setupCategory()
        
        settingsView.mySettingsPickerView.dataSource = self
        settingsView.mySettingsPickerView.delegate = self
    }
    func setupCategory() {
        var category = ""
        if let categorySelected = UserDefaults.standard.object(forKey: "Category") as? String {
            category = categorySelected
        } else {
            category = defaultCategory
        }
        setupSettings()
    }
    func setupSettings() {
        NYTBookAPI.getBookCategories { (appError, categories) in
            if let appError = appError {
                print("book categories error: \(appError)")
            } else if let categories = categories {
                self.settingsCategories = categories
            }
        }
    }
}
extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingsCategories.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return settingsCategories[row].displayName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let category = settingsCategories[row].listNameEncoded
        UserDefaults.standard.set(category, forKey: "Category")
        setupSettings()
    }
    
}

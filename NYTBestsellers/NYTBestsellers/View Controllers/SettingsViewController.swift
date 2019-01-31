//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func settingsPicker(row: Int)
}
class SettingsViewController: UIViewController {
    
    weak var delegate: SettingsViewControllerDelegate?
    let settingsView = SettingsView()
    
    private var settingsCategories = [CategoryResults](){
        didSet { //use case ex. when searching
            //tableview reload data needs to be on the main thread
            DispatchQueue.main.async {
                self.settingsView.mySettingsPickerView.reloadAllComponents()
                self.setupCategory()
            }
        }
    }

    let defaultCategory = "travel"
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title =
            "Pick Default Category"
        view.addSubview(settingsView)
        
        settingsView.mySettingsPickerView.dataSource = self
        settingsView.mySettingsPickerView.delegate = self
        setupSettings()
        setupCategory()
    }
    
    func setupCategory() {
        if let categorySelected = UserDefaults.standard.value(forKey: UserDefaultsKeys.settingsCategoryKey) as? Int {
            print(categorySelected)
            settingsView.mySettingsPickerView.selectRow(categorySelected, inComponent: 0, animated: true)
//            category = categorySelected
        } else {
            print("no category in defaults")
        }
//        else {
//            category = defaultCategory
//        }
//        setupSettings()
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
        print(settingsCategories[row])
        let category = row
        delegate?.settingsPicker(row: category)
        UserDefaults.standard.set(category, forKey: UserDefaultsKeys.settingsCategoryKey)
    }
    
}

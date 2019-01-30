//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {
let settingsView = SettingsView()
    private var categories = [Results](){
        didSet {
            DispatchQueue.main.async {
                self.settingsView.settingsPickerView.reloadAllComponents()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(settingsView)
        self.settingsView.settingsPickerView.delegate = self
        self.settingsView.settingsPickerView.dataSource = self
        getCategories()
    }
    
    private func getCategories() {
        bookAPIClient.getBooksCategory{ (appError, categories) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let categories = categories {
                self.categories = categories
            }
        }
    }
}

extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row].list_name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       let defaultSearch = categories[row].list_name
        UserDefaults.standard.set(defaultSearch, forKey: UserdDefaultKey.pickerviewkey)
    }
    
}

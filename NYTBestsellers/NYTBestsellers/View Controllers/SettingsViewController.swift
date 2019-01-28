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

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title =
            "Pick Default Category"
        view.addSubview(settingsView)
        NYTBookAPI.getBookCategories { (appError, categories) in
            if let appError = appError {
                print("book categories error: \(appError)")
            } else if let categories = categories {
                self.settingsCategories = categories
            }
        }
        settingsView.mySettingsPickerView.dataSource = self
        settingsView.mySettingsPickerView.delegate = self
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
    
    
}

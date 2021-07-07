//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    

    var pVCategories = [Books]() {
        didSet {
            DispatchQueue.main.async {
                self.settingsView.settingsPickerView.reloadAllComponents()
            }
        }
    }
    
    
    func getCategories() {
        NYTAPIClient.getBook { (appError, book) in
            if let appError = appError {
                print(appError.errorMessage())
            }
            if let data = book {
                self.pVCategories = data
            }
        }
    }
    
    let settingsView = SettingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.view.addSubview(settingsView)
        self.view.backgroundColor = .yellow
        getCategories()
        settingsView.settingsPickerView.dataSource = self
        settingsView.settingsPickerView.delegate = self
    
    }
     
}

extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pVCategories.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pVCategories[row].listName
    }
}

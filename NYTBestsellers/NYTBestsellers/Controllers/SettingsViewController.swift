//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let settingsView = SettingView()
    
    private var categoriesOfBooks = [BookCategories]() {
        didSet {
            DispatchQueue.main.async {
                self.settingsView.settingsPickerView.reloadAllComponents()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(settingsView) 
        self.view.backgroundColor = .green
        settingsView.settingsPickerView.dataSource = self
        settingsView.settingsPickerView.delegate = self
        getBookCategories()
        
    }
    
    func getBookCategories() {
        NYTBestsellers.fetchBooks { (error, books) in
            if let appError = error {
                print(appError)
            }
            if let books = books {
                self.categoriesOfBooks = books
            }
        }
    }

}

extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoriesOfBooks.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoriesOfBooks[row].categoryName
    }
    
}

//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Donkemezuo Raymond Tariladou on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    var bookCategories = [BookCategories]() {
        didSet{
            DispatchQueue.main.async {
                self.settings.pickerView.reloadAllComponents()
            }
        }
    }
    
    
    
    let settings = SettingsView()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        self.view.addSubview(settings)
        settings.pickerView.dataSource = self
        settings.pickerView.delegate = self
        getCategoriesData()

    }
    
    func getCategoriesData(){
        BookAPIClient.BookCategories { (error, bookCategory) in
            if let error = error {
                print("Error: \(error)")
            } else if let bookCategoris = bookCategory {
                self.bookCategories = bookCategoris
            }
        }
    }
  

}
extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bookCategories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bookCategories[row].list_name
    }
    
}

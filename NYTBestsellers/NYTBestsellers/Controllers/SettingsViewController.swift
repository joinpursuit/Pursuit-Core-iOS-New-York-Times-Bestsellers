//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Kevin Waring on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    let settingsView = SettingsView()
    
    
    
    var listNames = [Genre](){
        didSet {
            DispatchQueue.main.async {
                self.settingsView.myPicker.reloadAllComponents()
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(settingsView)
        settingsView.myPicker.dataSource = self
        settingsView.myPicker.delegate = self
        APIClient.getListName { (apperror, listNames) in
            if let apperror = apperror {
                print(apperror)
            }
            if let listNames = listNames {
                self.listNames = listNames
            }
        }
    }
    

    

}
extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listNames[row].list_name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let chosenCatergory = listNames[row].list_name
        APIClient.getBooks(listName: chosenCatergory) { (appError, books) in
            if let appError = appError {
                print(appError)
            }
           // if let books = books {
              //  self.books = books
            //}
            //user defaults
            UserDefaults.standard.set(self.listNames[row].list_name, forKey: "DefaultGenre")
            UserDefaults.standard.set(String(row) , forKey: "DefaultInt")
        }
    }
    
}

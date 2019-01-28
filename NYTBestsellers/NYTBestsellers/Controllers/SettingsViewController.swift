//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {
let settingsView = SettingsView()
    let bestSellerCategory = [BookDataResultsArray]()
    var listName = ""
    override func viewDidLoad() {
        self.title = "Settings"
        view.addSubview(settingsView)
        settingsView.settingsPickerViewObj.dataSource = self
        settingsView.settingsPickerViewObj.delegate =  self
        //gatherNYTimesBestSellerData(listOfTypes: listName)
    }
//    func gatherNYTimesBestSellerData(listOfTypes: String){
//        NewYorkBestSellerApiClient.getBestSellerByCategory(category: listOfTypes) { (appError, onlineCategories) in
//            if let appError = appError {
//                print(appError.errorMessage())
//            }
//            if let onlineCategories = onlineCategories{
//
//            }
//        }
//    }
}

extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bestSellerCategory.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bestSellerCategory[row].listName
    }
    
    
}

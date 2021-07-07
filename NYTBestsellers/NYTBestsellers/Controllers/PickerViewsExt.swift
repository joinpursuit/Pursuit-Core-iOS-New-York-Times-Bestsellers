//
//  PickerViewExt.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
extension BestSellerViewController:UIPickerViewDataSource{
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return categories.count
  }
  
}
extension BestSellerViewController:UIPickerViewDelegate{
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let category = categories[row].list_name
    getBooks(category: category)
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    let category = categories[row].list_name
    
    return category
  }
}

extension SettingsViewController:UIPickerViewDataSource{
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return categories.count
  }
  
  
}
extension SettingsViewController:UIPickerViewDelegate{
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let category = categories[row].list_name
    let theRow = row
    UserDefaults.standard.set(category, forKey: UserDefaultsKeys.chosenCateogry)
    UserDefaults.standard.set(theRow, forKey: UserDefaultsKeys.row)
    self.settingsView.settingPickerView.selectRow(theRow, inComponent: 0, animated: true)
  }
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return categories[row].list_name
  }
}

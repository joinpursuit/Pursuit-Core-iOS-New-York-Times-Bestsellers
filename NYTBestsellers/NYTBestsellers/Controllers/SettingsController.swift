//
//  SettingsController.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

  let settings = SettingsView()
  
  var arrayOfPickerViewData = [BookCategories]() {
    didSet{
      DispatchQueue.main.async {
        self.settings.settingsPickerView.reloadAllComponents()
      }
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.addSubview(settings)
      view.backgroundColor = .white
      navigationItem.title = "Settings"
      
      arrayOfPickerViewData = PickerViewDataHelper.getPickerViewCategoriesData()
      dump(arrayOfPickerViewData)
      
      settings.settingsPickerView.dataSource = self
      settings.settingsPickerView.delegate = self
    }
  
  
  //TODO - SAVE to user default didSelectRowat



}

extension SettingsController: UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return arrayOfPickerViewData.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return arrayOfPickerViewData[row].listName
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    let categoryName = arrayOfPickerViewData[row].listName
    
  }
  
  
}

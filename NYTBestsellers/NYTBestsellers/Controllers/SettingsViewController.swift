//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let settingsView = SettingsView()
    var genre = [Results](){
        didSet{
            DispatchQueue.main.async {
                self.settingsView.pickerView.reloadAllComponents()
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(settingsView)
        settingsView.pickerView.dataSource = self
        settingsView.pickerView.delegate = self
        getGenres()
    }
    
    private func getGenres(){
        APIClient.getGenres { [weak self] (result) in
             switch result {
              case .failure(let appError):
              DispatchQueue.main.async {
              self?.showAlert(title: "App Error", message: "\(appError)")
                           }
              case .success(let result):
                self?.genre = result!
                           
            }
        }
    }
    
    
    
}
extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genre.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return genre[row].listName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      let defaultSearch = row
      let defaultCategory = genre[row].listName
      UserDefaults.standard.set(defaultSearch, forKey: UserDefaultKeys.pickerviewkey)
        UserDefaults.standard.set(defaultCategory, forKey: UserDefaultKeys.pickerviewkey2)
    }
    
}

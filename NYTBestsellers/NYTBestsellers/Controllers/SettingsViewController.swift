//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let settingsView = SettingsView()

    var settingsGenre = [GenreType]() {
        didSet {
            DispatchQueue.main.async {
                self.settingsView.settingsPicker.reloadAllComponents()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Settings"
        view.addSubview(settingsView)
        settingsView.settingsPicker.dataSource = self
        settingsView.settingsPicker.delegate = self
        getGenres()

    }
    
    
    func getGenres() {
        NYTimesAPIClient.getGenre { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                self.settingsGenre = data
                if let pickedRow = (UserDefaults.standard.object(forKey: DefaultKeys.pickerRow)) as? String {
                    DispatchQueue.main.async {
                        self.settingsView.settingsPicker.selectRow(Int(pickedRow)!, inComponent: 0, animated: true)
                    }
                }
            }
        }
    }

   

}

extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingsGenre.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return settingsGenre[row].list_name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(settingsGenre[row].list_name.replacingOccurrences(of: " ", with: "-"), forKey: DefaultKeys.genre )
        UserDefaults.standard.set(String(row), forKey: DefaultKeys.pickerRow)
    }
}

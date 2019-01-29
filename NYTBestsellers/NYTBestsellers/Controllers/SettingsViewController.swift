//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let settingsView = SettingsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(settingsView)
        settingsView.pickerView.dataSource = self
        settingsView.pickerView.delegate = self
        checkForUserDefaultsSetting()
    }
    
    private func checkForUserDefaultsSetting() {
        if let rowNumber = UserDefaults.standard.object(forKey: "Book Category Index Number") as? Int {
            settingsView.pickerView.selectRow(rowNumber, inComponent: 0, animated: true)
        } else {
            settingsView.pickerView.selectRow(0, inComponent: 0, animated: true)
        }
    }

}

extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(row, forKey: "Book Category Index Number")
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return SavedBookCategories.bookCategories[row].list_name
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return SavedBookCategories.bookCategories.count
    }
    
    
}

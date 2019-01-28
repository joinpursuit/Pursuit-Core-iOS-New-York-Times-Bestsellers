//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {

    
    var settingView = SettingsView()
    var listNames = DataPersistenceModel.getListNames()
    override func viewDidLoad() {
        title = "Pick Default Category"
        super.viewDidLoad()
        listNames = DataPersistenceModel.getListNames()
        view.addSubview(settingView)
        settingView.settingsPickerView.dataSource = self
        settingView.settingsPickerView.delegate = self

        // Do any additional setup after loading the view.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listNames.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listNames[row].listName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        UserDefaults.standard.set(listNames[row].listName, forKey: "ListNames")
        UserDefaults.standard.set(row, forKey: "Row")
    }
    
}

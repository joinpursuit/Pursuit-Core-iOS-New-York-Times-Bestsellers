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
    let listNames = DataPersistenceModel.getListNames()
    override func viewDidLoad() {
        super.viewDidLoad()
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
}

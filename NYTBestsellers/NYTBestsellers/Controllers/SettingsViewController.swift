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
    }

}

extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 12
    }
    
    
}

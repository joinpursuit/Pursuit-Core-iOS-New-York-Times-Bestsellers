//
//  SettingsView.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsView: UIView {

    lazy var settingsPickerView: UIPickerView = {
        var pickerView = UIPickerView()
        return pickerView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .white
        setupPicker()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPicker(){
        addSubview(settingsPickerView)
        settingsPickerView.translatesAutoresizingMaskIntoConstraints = false
        settingsPickerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        settingsPickerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}

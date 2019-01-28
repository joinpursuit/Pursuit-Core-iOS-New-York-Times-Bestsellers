//
//  SettingsView.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsView: UIView {

    public lazy var settingsPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        return pickerView
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupSettingsPickerView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupSettingsPickerView() {
        self.addSubview(settingsPickerView)
        settingsPickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([settingsPickerView.topAnchor.constraint(equalTo: settingsPickerView.bottomAnchor, constant: 20),settingsPickerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.40),settingsPickerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),settingsPickerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),settingsPickerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),settingsPickerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -12)])
    }
    
}

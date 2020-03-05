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
        pickerView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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
        NSLayoutConstraint.activate([
            settingsPickerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),settingsPickerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),settingsPickerView.centerXAnchor.constraint(equalTo: self.centerXAnchor), settingsPickerView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
    }
    
}

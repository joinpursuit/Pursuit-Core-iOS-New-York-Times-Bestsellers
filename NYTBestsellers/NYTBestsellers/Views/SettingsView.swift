//
//  SettingsView.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    private lazy var settingsPicker: UIPickerView = {
        let picker = UIPickerView.init(frame: self.bounds)
        picker.backgroundColor = .blue
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupView()
    }
}
extension SettingsView {
    private func setupView() {
        setupPicker()
    }
    
    private func setupPicker() {
        addSubview(settingsPicker)
        settingsPicker.translatesAutoresizingMaskIntoConstraints = false
        settingsPicker.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        settingsPicker.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        settingsPicker.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        settingsPicker.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        settingsPicker.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}

extension SettingsView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "hello"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}

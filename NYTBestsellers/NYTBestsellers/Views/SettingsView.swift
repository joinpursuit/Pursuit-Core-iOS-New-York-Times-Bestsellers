//
//  SettingsView.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    public lazy var settingsPicker: UIPickerView = {
        let picker = UIPickerView.init(frame: self.bounds)
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



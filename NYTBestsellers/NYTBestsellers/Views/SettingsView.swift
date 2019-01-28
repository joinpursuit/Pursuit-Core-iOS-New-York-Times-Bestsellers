//
//  SettingView.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingView: UIView {

  
    lazy var settingsPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .gray
        return pickerView
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
        backgroundColor = .green
        setConstraints()
    }
    
    func setConstraints() {
    self.addSubview(settingsPickerView)
    settingsPickerView.translatesAutoresizingMaskIntoConstraints = false
    //settingsPickerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
    settingsPickerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.45).isActive = true
    //settingsPickerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
    //settingsPickerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
    settingsPickerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    //settingsPickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -12).isActive = true
    settingsPickerView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0 ).isActive = true
}
}

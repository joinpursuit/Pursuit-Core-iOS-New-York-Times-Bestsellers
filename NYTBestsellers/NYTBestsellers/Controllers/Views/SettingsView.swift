//
//  SettingsView.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    public lazy var settingsPickerView: UIPickerView = {
        let settingsPicker = UIPickerView()
        
        settingsPicker.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return settingsPicker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(settingsPickerView)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .red
        setConstraints()
    }
    
    func setConstraints() {
        self.addSubview(settingsPickerView)
        
        settingsPickerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            settingsPickerView.centerXAnchor.constraint(equalTo: self.centerXAnchor), settingsPickerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),settingsPickerView.topAnchor.constraint(equalTo: self.topAnchor), settingsPickerView.leadingAnchor.constraint(equalTo: self.leadingAnchor), settingsPickerView.trailingAnchor.constraint(equalTo: self.trailingAnchor), settingsPickerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
    
}

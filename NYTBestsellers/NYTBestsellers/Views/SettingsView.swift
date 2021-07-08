//
//  SettingsView.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    public lazy var mySettingsPickerView: UIPickerView = {
        let cv = UIPickerView()
        cv.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return cv
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
        setupViews()
    }
}
extension SettingsView {
    private func setupViews() {
        setupPickerView()
    }
    private func setupPickerView () {
        addSubview(mySettingsPickerView)
        mySettingsPickerView.translatesAutoresizingMaskIntoConstraints = false
        mySettingsPickerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mySettingsPickerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mySettingsPickerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        mySettingsPickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}


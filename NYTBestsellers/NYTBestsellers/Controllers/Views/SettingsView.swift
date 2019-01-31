//
//  SettingsView.swift
//  NYTBestsellers
//
//  Created by Biron Su on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsView: UIView {

    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView.init(frame: self.bounds)
        picker.backgroundColor = .white
        return picker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)

        setupPickerView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupPickerView()
        fatalError("init(coder:) failed to implement")
    }
    private func setupPickerView(){
        addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        pickerView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
    }
}

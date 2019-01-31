//
//  SettingsView.swift
//  NYTBestsellers
//
//  Created by Kevin Waring on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsView: UIView {

    lazy var myPicker: UIPickerView = {
        let picker = UIPickerView.init(frame: self.bounds)
        picker.backgroundColor = .lightGray
        
        return picker
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setUpPickerView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpPickerView()
        fatalError("init(coder:) has not been implemented")
    }
    private func setUpPickerView() {
        addSubview(myPicker)
        myPicker.translatesAutoresizingMaskIntoConstraints = false
        myPicker.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        myPicker.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        myPicker.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        myPicker.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        myPicker.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        
    }
}



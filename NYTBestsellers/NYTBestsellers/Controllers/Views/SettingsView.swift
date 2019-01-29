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
        picker.backgroundColor = .blue
        return picker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .green
        setupPickerView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .green
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
extension SettingsView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 50
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}

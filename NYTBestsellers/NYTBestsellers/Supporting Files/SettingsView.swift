//
//  SettingsView.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    let colors = ["red", "blue", "green"]
    lazy var settingsPickerViewObj: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.frame = CGRect(x: 0, y: 350, width: frame.width, height: 200)
        pickerView.backgroundColor = UIColor.white
        pickerView.dataSource = self
        pickerView.delegate =  self
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
    private func commonInit(){
        backgroundColor = .yellow
        addSubview(settingsPickerViewObj)
//        setupSettingsPickerView()
    }

    private func setupSettingsPickerView(){
        
    }
    
    
}

extension SettingsView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    
    
}

//
//  SettingsView.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    lazy var image: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    lazy var settingsPickerViewObj: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.frame = CGRect(x: 0, y: 350, width: frame.width, height: 200)
        pickerView.backgroundColor = UIColor.white
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

    }

    
    
    
}



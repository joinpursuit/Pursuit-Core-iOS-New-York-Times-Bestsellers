//
//  SettingView.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingView: UIView {

   //picker view
    lazy var categoryPickerView: UIPickerView = {
        let pv = UIPickerView()
        pv.backgroundColor = UIColor(hexString: "5a92af")
        return pv
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
        setupView()
    }
}

extension SettingView {
    private func setupView() {
        setupSettingPickerView()
    }
    
    private func setupSettingPickerView() {
        addSubview(categoryPickerView)
        categoryPickerView.translatesAutoresizingMaskIntoConstraints = false
        categoryPickerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        categoryPickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        categoryPickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        categoryPickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    }
}

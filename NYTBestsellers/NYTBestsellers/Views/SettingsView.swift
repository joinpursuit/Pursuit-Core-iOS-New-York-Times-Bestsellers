//
//  SettingsView.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsView: UIView {
  
  
  lazy var settingsPickerView: UIPickerView = {
    let pickerView = UIPickerView()
    pickerView.backgroundColor = #colorLiteral(red: 0.9489085307, green: 0.9425356894, blue: 0.9464035614, alpha: 1)
    
    return pickerView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    addSubview(settingsPickerView)
    setSettingsView()
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SettingsView {
  
  private func setSettingsView() {
    settingsPickerview()
  }
  
  private func settingsPickerview() {
    settingsPickerView.translatesAutoresizingMaskIntoConstraints = false
    
    settingsPickerView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    settingsPickerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    settingsPickerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    settingsPickerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive =  true
  }
}

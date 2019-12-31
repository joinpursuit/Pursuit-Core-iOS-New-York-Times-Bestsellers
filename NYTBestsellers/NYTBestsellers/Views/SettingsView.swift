//
//  SettingsView.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsView: UIView {
  
  
  public lazy var pickerView: UIPickerView = {
    let pickerView = UIPickerView()
    return pickerView
  }()
  
  override init(frame: CGRect) {
    super .init(frame: UIScreen.main.bounds)
    
    
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit(){
    backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    setUpView()
  }
}

extension SettingsView {
  private func setUpView(){
    setUpPickerView()
  }
  
  
  func setUpPickerView(){
    addSubview(pickerView)
    pickerView.translatesAutoresizingMaskIntoConstraints = false
    pickerView.bottomAnchor.constraint(equalTo:safeAreaLayoutGuide.bottomAnchor).isActive = true
    pickerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    pickerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 1).isActive = true
  }
  
  
}


//
//  SettingsViews.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViews: UIView {

  lazy var settingPickerView:UIPickerView = {
    let pickerView = UIPickerView()
    pickerView.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
  
    return pickerView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    setUpPickerConstraints()
    self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
func setUpPickerConstraints(){
  addSubview(settingPickerView)
settingPickerView.translatesAutoresizingMaskIntoConstraints = false
  settingPickerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
  settingPickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
  settingPickerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
  settingPickerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
  }
  
}

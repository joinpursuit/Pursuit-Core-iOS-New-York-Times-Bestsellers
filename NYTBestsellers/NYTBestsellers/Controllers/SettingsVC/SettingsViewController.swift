//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

  let settingsView = SettingsViews()
  
  var categories = [CategoryInfo]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = #colorLiteral(red: 1, green: 0.7796209455, blue: 0.5596221685, alpha: 1)
      settingsView.settingPickerView.dataSource = self
      settingsView.settingPickerView.delegate = self
      self.view.addSubview(settingsView)
    
      title = "Settings"
    }
    

  
}

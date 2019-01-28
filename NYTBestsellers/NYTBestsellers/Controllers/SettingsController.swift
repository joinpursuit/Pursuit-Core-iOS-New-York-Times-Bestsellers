//
//  SettingsController.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

  let settings = SettingsView()
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.addSubview(settings)
      view.backgroundColor = .white
      navigationItem.title = "Settings"
      
    }
  
  
  //TODO - SAVE to user default didSelectRowat



}

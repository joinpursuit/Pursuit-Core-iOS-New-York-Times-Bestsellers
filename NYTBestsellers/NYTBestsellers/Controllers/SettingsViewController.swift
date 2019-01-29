//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let settingsView = SettingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(settingsView) 
        self.view.backgroundColor = .green
        
    }
    

    

}

//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let settingsView = SettingsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Settings"
        view.addSubview(settingsView)

    }
    

   

}

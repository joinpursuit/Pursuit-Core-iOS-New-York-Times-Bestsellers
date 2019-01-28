//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
let settingsView = SettingsView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.view.backgroundColor = . orange
        self.view.addSubview(settingsView)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  NYTBestsellersViewController.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTBestsellersViewController: UIViewController {
    
    let bestsellerView = BestsellersView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bestsellerView)
        self.view.backgroundColor = .red
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

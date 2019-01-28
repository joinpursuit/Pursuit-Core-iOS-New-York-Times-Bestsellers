//
//  DetailViewController.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        navigationItem.title = "Details"

        
    }
    

    

}

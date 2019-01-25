//
//  BestSellersViewController.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersViewController: UIViewController {

    let bestSellers = BestSellersView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "NYT Bestsellers"
        view.addSubview(bestSellers)
        
    }
    

    

}

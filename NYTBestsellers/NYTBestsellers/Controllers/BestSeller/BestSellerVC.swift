//
//  BestSellerVC.swift
//  NYTBestsellers
//
//  Created by Joshua Viera on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerVC: UIViewController {

    var bestSellerView = BestSellerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bestSellerView)
    }

}

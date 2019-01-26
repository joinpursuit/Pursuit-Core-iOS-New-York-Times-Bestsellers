//
//  BestSellersViewController.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersViewController: UIViewController {
    let bestSellerView = BestSellerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        bestSellerView.colloectionView.register(BestSellerCell.self, forCellWithReuseIdentifier: "BestSellerCell")
        view.addSubview(bestSellerView)
    }
    


}



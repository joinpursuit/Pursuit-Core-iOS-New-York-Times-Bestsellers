//
//  BestSellersViewController.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersViewController: UIViewController {
    let bestSellerVC = BestSellersView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bestSellerVC)
    }
    


}

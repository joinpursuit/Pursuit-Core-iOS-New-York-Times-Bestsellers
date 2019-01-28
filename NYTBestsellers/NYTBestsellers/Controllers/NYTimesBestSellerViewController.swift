//
//  NYTimesBestSellerViewController.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTimesBestSellerViewController: UIViewController {
    let nyTimesCollection = BestSellerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NYT BestSellers"
        self.view.backgroundColor = .white
        view.addSubview(nyTimesCollection)
        
    }

}

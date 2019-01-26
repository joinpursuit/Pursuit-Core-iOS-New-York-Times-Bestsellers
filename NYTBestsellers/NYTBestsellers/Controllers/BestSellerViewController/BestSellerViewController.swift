//
//  BestSellerViewController.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerViewController: UIViewController {
  
  let bestSellerView = BestSellerView()
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = #colorLiteral(red: 1, green: 0.6699612737, blue: 0.8998487592, alpha: 1)
      self.view.addSubview(bestSellerView)
     bestSellerView.bestSellersCollectionView.delegate = self
      bestSellerView.bestSellersCollectionView.dataSource = self
      bestSellerView.categoryPickerView.dataSource = self
   title = "BestSellers"
  }
  var currentIndex = Int()


}

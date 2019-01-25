//
//  NYTBestSellerControllerViewController.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTBestSellerController: UIViewController {
  
  let bestSellerView = BestSellerView()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
  
    self.view.addSubview(bestSellerView)
    
    navigationItem.title = "Best Sellers"

    bestSellerView.bestSellerCollectionView.dataSource = self
  }
  
}

extension NYTBestSellerController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return UICollectionViewCell()
  }
  
  
}




//
//  BestSellerView.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerView: UIView {
  
  lazy var bestSellerCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 190, height: 250)
    layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
    layout.scrollDirection = .horizontal
    
    let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
    collectionView.backgroundColor = #colorLiteral(red: 0.9257920923, green: 0.9627893281, blue: 0.9841015494, alpha: 1)
    
    
  
    
    return collectionView
    
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    addSubview(bestSellerCollectionView)
    setConstraints()
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setConstraints() {
    bestSellerCollectionView.translatesAutoresizingMaskIntoConstraints = false
    bestSellerCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    bestSellerCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    bestSellerCollectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive =  true
    
  }
  
}

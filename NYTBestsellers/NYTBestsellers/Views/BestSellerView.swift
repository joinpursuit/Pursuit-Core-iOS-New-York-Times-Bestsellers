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
    layout.itemSize = CGSize(width: 100, height: 100)
    layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
    
    let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
    
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
    bestSellerCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    bestSellerCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 11).isActive = true
    bestSellerCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
    bestSellerCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    
  }
  
}

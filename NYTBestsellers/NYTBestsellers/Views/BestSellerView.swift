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
  
  
  lazy var categoryPickerView: UIPickerView = {
    let pickerView = UIPickerView()
    pickerView.backgroundColor = .white
    
    return pickerView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    addSubview(bestSellerCollectionView)
    addSubview(categoryPickerView)
    setBestSellerView()
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension BestSellerView {
  private func setBestSellerView() {
    collectionViewConstraints()
    pickerViewConstraints()
  }
  
  
  func collectionViewConstraints() {
    bestSellerCollectionView.translatesAutoresizingMaskIntoConstraints = false
    bestSellerCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    bestSellerCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    bestSellerCollectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive =  true
    
  }

  private func pickerViewConstraints() {
    categoryPickerView.translatesAutoresizingMaskIntoConstraints = false
    categoryPickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
    categoryPickerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
    categoryPickerView.widthAnchor.constraint(equalTo: widthAnchor).isActive =  true

  }
  
  
}

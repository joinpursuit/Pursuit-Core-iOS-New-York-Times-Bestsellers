//
//  BestSellerView.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerView: UIView {

  public lazy var bestSellersCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let cv = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
    cv.register(BestSellerCollectionViewCell.self, forCellWithReuseIdentifier: "bestSeller")
    cv.clipsToBounds = true
    cv.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    return cv
  }()
  
  public lazy var categoryPickerView:UIPickerView = {
  let pickerView = UIPickerView()
    pickerView.backgroundColor = #colorLiteral(red: 0.4278073907, green: 0.3330721855, blue: 0.3150036633, alpha: 1)
  return pickerView
  }()
  
  
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    self.backgroundColor = #colorLiteral(red: 0.4278073907, green: 0.3330721855, blue: 0.3150036633, alpha: 1)
    setupViews()
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}

extension BestSellerView {
  private func setupViews() {
    setupCollectionView()
    setupPickerView()
  }
  
  private func setupCollectionView() {
    addSubview(bestSellersCollectionView)
bestSellersCollectionView.translatesAutoresizingMaskIntoConstraints = false
 bestSellersCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.6).isActive = true
  bestSellersCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
  bestSellersCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
  bestSellersCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
  }
  private func setupPickerView(){
    addSubview(categoryPickerView)
    categoryPickerView.translatesAutoresizingMaskIntoConstraints = false

    categoryPickerView.topAnchor.constraint(equalTo: self.bestSellersCollectionView.bottomAnchor).isActive = true
    categoryPickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    categoryPickerView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor).isActive = true
  }
}

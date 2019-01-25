//
//  BestSellerCollectionCell.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerCollectionCell: UICollectionViewCell {
//  lazy var imageCover: UIImageView = {
//
//    
//
//  }()
  
  lazy var weeksLabel: UILabel = {
    let label = UILabel()
    
    return label 
  }()
  
  
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}

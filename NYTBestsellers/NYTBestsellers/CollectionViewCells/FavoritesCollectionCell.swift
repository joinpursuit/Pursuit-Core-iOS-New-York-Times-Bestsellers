//
//  FavoritesCollectionCell.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesCollectionCell: UICollectionViewCell {
  
  lazy var moreActions: UIButton = {
    let button = UIButton()
    button.backgroundColor = .blue
    button.setTitle("...", for: .normal)
    
    //    button.addTarget(self, action: #selector(seguePressed), for: .touchUpInside)
    
    return button
  }()
  
}

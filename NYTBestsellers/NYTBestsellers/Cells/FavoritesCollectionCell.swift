//
//  FavoritesCollectionCell.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesCollectionCell: UICollectionViewCell {
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  FavoriteCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit


class FavoriteCollectionViewCell: UICollectionViewCell {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .blue
        layer.cornerRadius = 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

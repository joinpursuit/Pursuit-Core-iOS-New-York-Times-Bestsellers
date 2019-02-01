//
//  FavoriteView.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteView: UIView {

    //uicollection view & constraints
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setupView()
    }
}

extension FavoriteView {
    private func setupView() {
        setupFavoriteCollectionView()
    }
    
    private func setupFavoriteCollectionView() {
        
    }
}

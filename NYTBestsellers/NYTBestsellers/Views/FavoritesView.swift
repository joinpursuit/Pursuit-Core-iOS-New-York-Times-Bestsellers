//
//  FavoritesView.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesView: UIView {

    lazy var favoriteCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 300, height: 325)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        let cv = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        cv.register(FavoritesCollectionViewCell.self, forCellWithReuseIdentifier: "FavoritesCell")
        cv.backgroundColor = .yellow
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.addSubview(favoriteCollectionView)
        self.addSubview(favoriteCollectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}


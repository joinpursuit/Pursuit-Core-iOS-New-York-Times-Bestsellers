//
//  FavoritesView.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit



class FavoriteView: UIView {
   
    
    
    
    
    lazy var favoriteCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        let myCollectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        myCollectionView.backgroundColor = .yellow
        
        myCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        return myCollectionView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .orange
    favoriteCollectionViewContrains()
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func favoriteCollectionViewContrains() {
    addSubview(favoriteCollectionView)
        favoriteCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}



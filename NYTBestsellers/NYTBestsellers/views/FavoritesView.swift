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
        layout.itemSize = CGSize.init(width: 350, height: 400)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        let myCollectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        myCollectionView.backgroundColor = .yellow
        myCollectionView.register(FavoriteCollectionViewCell.self, forCellWithReuseIdentifier: "favoriteCell")
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
        favoriteCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        favoriteCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        favoriteCollectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        favoriteCollectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}



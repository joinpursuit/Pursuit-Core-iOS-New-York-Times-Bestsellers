//
//  FavoritesView.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesView: UIView {
    
    public lazy var favoritesCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.bounds.width, height: (self.bounds.height) / 2)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = #colorLiteral(red: 0.9257920923, green: 0.9627893281, blue: 0.9841015494, alpha: 1)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupFavoritesCollectionView()
        
        favoritesCollectionView.register(FavoritesCollectionCell.self, forCellWithReuseIdentifier: "FavoritesCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupFavoritesCollectionView() {
        addSubview(favoritesCollectionView)
        
        favoritesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
            favoritesCollectionView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                favoritesCollectionView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
                favoritesCollectionView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
                favoritesCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor),
                favoritesCollectionView.widthAnchor.constraint(equalTo: widthAnchor)
                                        ])
        }
    
}

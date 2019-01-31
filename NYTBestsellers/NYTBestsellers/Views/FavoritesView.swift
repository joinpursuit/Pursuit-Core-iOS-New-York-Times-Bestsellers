//
//  FavoritesView.swift
//  NYTBestsellers
//
//  Created by Kevin Waring on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesView: UIView {

    
    lazy var myCollectionView: UICollectionView = {
        //create the layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 325, height: 350)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        
        layout.scrollDirection = .vertical
        var cv = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
        
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupCollectionView()
        self.myCollectionView.register(FavoritesCollectionViewCell.self , forCellWithReuseIdentifier: "FavoriteCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCollectionView()
        fatalError("init(coder:) has not been implemented")
    }
    private func setupCollectionView() {
        addSubview(myCollectionView)
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        myCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        myCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        myCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true



        myCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        
    }

}

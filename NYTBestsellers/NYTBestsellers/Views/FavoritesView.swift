//
//  FavoritesView.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesView: UIView {

    public lazy var myFavoritesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 350, height: 350) // cell size
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        let cv = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        cv.register(FavoritesCollectionViewCell.self, forCellWithReuseIdentifier: "FavoritesCollectionViewCell")
        cv.backgroundColor = .yellow
        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    //    override func layoutSubviews() {
    //        super.layoutSubviews()
    //    }
    
    
}
extension FavoritesView {
    private func setupViews() {
        setupCollectionView()
    }
    
    private func setupCollectionView () {
        addSubview(myFavoritesCollectionView)
        myFavoritesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myFavoritesCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        myFavoritesCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        myFavoritesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        myFavoritesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}


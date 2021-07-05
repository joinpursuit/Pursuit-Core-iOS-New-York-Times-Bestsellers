//
//  FavoritesView.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesView: UIView {
    
    public lazy var favCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize.init(width: 300, height: 400)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        
        let cv = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        cv.backgroundColor = .gray
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
        self.favCollectionView.register(FavoritesCollectionViewCell.self, forCellWithReuseIdentifier: "FavoritesCell")
        setupView()
    }
    
}
extension FavoritesView {
    private func setupView() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        addSubview(favCollectionView)
        favCollectionView.translatesAutoresizingMaskIntoConstraints = false
        favCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        favCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        favCollectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        favCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
}



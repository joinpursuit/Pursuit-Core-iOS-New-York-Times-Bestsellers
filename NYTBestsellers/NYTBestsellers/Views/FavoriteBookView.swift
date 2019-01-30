//
//  FavoriteBookVIew.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteBookView: UIView {
    lazy var collectionViewCellObj: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize =  CGSize.init(width: 350, height: 400)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit(){
        backgroundColor = .white
        addSubview(collectionViewCellObj)
        collectionViewCellObj.register(FavoiteBookCell.self, forCellWithReuseIdentifier: "FavoriteCell")
        setupViews()
    }
    private func setupViews(){
        setupFavoriteCollectionViewContraints()
        
        
    }
    private func setupFavoriteCollectionViewContraints() {
        collectionViewCellObj.translatesAutoresizingMaskIntoConstraints = false
        
        
         collectionViewCellObj.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
         collectionViewCellObj.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
         collectionViewCellObj.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
         collectionViewCellObj.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
 
        
    }

}


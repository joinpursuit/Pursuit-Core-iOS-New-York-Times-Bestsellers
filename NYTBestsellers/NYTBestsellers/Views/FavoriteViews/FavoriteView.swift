//
//  FavoriteViewController.swift
//  NYTBestsellers
//
//  Created by Donkemezuo Raymond Tariladou on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteView: UIView {

    public lazy var collectionView: UICollectionView = {
        let cellLayout = UICollectionViewFlowLayout()
        cellLayout.scrollDirection = .vertical
        cellLayout.sectionInset =  UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        cellLayout.itemSize = CGSize.init(width: 300, height: 300)
        
        let favoritedBooksCV = UICollectionView(frame: CGRect.zero, collectionViewLayout: cellLayout)
        
        favoritedBooksCV.backgroundColor = UIColor.red.withAlphaComponent(0.1)

        return favoritedBooksCV
        
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(collectionView)
        setCollectionViewConstrains()
        self.collectionView.register(FavoriteCollectionViewCell.self, forCellWithReuseIdentifier: "FCVCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
  
    func setCollectionViewConstrains() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, constant: 0).isActive = true 
        collectionView.widthAnchor.constraint(equalTo: widthAnchor, constant: 0).isActive = true
    }

}


    
    


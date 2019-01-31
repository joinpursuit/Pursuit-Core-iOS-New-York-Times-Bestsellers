//
//  FavoritesView.swift
//  NYTBestsellers
//
//  Created by Joshua Viera on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesView: UIView {
    
    
    lazy var myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 320, height: 200)
        var cv = UICollectionView(frame:  self.bounds, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .black
        return cv
    }()
    
    var favCellId = "Fav"
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        fatalError("init(coder:) failed to implement")
    }
    
    private func commonInit() {
        setupViews()
        myCollectionView.register(FavoriteCell.self, forCellWithReuseIdentifier: favCellId)
        backgroundColor = .white
    }
    
    private func setupViews(){
        setConstraints()
    }
    
    private func setConstraints(){
        addSubview(myCollectionView)
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        myCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        myCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
       myCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}


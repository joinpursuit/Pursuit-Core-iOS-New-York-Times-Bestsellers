//
//  FavoritesView.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesView: UIView {
    
    private lazy var favCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize.init(width: 200, height: 300)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        
        let cv = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        cv.backgroundColor = .gray
        cv.dataSource = self
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
        backgroundColor = .red
        self.favCollectionView.register(FavoritesCollectionViewCell.self, forCellWithReuseIdentifier: "FavoritesCell")
        
    }
}

extension FavoritesView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCell", for: indexPath) as? FavoritesCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    
}

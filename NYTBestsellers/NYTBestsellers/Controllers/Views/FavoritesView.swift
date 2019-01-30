//
//  FavoritesView.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesView: UIView {

    public lazy var favesCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 350, height: 350)
        layout.sectionInset = UIEdgeInsets.init(top: 22, left: 11, bottom: 22, right: 22)
        
        let cv = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        layout.scrollDirection = .vertical
        cv.backgroundColor = .blue
        return cv
    }()
  
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(favesCollectionView)        
        favesCollectionView.register(FavesCollectionViewCell.self, forCellWithReuseIdentifier: "FavesCollectionViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setConstraints()
    }
    
    func setConstraints() {
        self.addSubview(favesCollectionView)
        
        favesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favesCollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor), favesCollectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
            ])
    }
    
}
extension FavoritesView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavesCollectionViewCell", for: indexPath) as? FavesCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
}

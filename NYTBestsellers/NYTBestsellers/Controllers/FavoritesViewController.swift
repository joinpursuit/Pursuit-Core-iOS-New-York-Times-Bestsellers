//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    let favoritesView = FavoritesView()
    let arrayToTest: [String] = ["favorites", "favorites", "favorites", "favorites"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = FavoritesView()
        self.view.backgroundColor = .yellow
        self.view.addSubview(favoritesView)
        self.favoritesView.favoriteCollectionView.delegate = self
        self.favoritesView.favoriteCollectionView.dataSource = self
        
        
    }
    
}

extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCell", for: indexPath) as? FavoritesCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}

//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//



import UIKit


class FavoriteViewController: UIViewController {
let favoriteView = FavoriteView()
    let arrayToTest: [String] = ["favorite","favorite","favorite","favorite","favorite","favorite","favorite","favorite","favorite"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.addSubview(favoriteView)
        self.favoriteView.favoriteCollectionView.delegate = self
        self.favoriteView.favoriteCollectionView.dataSource = self
    }
    
}

extension FavoriteViewController: UICollectionViewDelegateFlowLayout {
    
}

extension FavoriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayToTest.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCell", for: indexPath) as? FavoriteCollectionViewCell else {return UICollectionViewCell() }
        
        return cell
    }
    
    
}

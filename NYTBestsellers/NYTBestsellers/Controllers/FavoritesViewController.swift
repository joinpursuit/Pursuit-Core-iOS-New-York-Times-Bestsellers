//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    let favoritesView = FavoritesView()
    
    private var favoriteBooks = [FavoriteBook]() {
        didSet {
            DispatchQueue.main.async {
        self.favoritesView.favesCollectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(favoritesView)
        favoriteBooks = EventDataManager.fetchFavoriteBooksFromDocumentsDirectory()
        favoritesView.favesCollectionView.dataSource = self
        favoritesView.favesCollectionView.delegate = self
        self.view.backgroundColor = .yellow
        navigationItem.title = "Favorites"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }

}

extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavesCollectionViewCell", for: indexPath) as? FavesCollectionViewCell else { return UICollectionViewCell() }
        let faveBook = favoriteBooks[indexPath.row]
        cell.configureCell(favoriteBook: faveBook)
        return cell
        
    }
    
    
}

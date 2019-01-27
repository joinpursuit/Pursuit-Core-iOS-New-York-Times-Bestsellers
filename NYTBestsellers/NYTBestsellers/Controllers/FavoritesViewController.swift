//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UICollectionViewDataSource {

    
    
    var favoritesView = FavoritesView()
    let favoriteBooks = DataPersistenceModel.getFavoriteBooks()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(favoritesView)
        favoritesView.favoritesCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCell else {return UICollectionViewCell()}
        let bookToSet = favoriteBooks[indexPath.row]
        cell.favoriteLabel.text = bookToSet.bookName
        cell.favoriteDetailsTextView.text = bookToSet.description
        if let image = UIImage(data: bookToSet.imageData){
            cell.favoriteImage.image = image
        }
        return cell
        
    }

}

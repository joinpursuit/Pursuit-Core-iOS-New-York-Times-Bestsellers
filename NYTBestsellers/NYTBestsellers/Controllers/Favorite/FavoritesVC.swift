//
//  FavoritesVC.swift
//  NYTBestsellers
//
//  Created by Joshua Viera on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesVC: UIViewController {

    var favoritesView = FavoritesView()
    var favoriteBooks = DataPersistenceModel.getFavoriteBooks()
    var favCellId = "Fav"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesView.myCollectionView.delegate = self
        favoritesView.myCollectionView.dataSource = self
        view.addSubview(favoritesView)
    }

    override func viewDidAppear(_ animated: Bool) {
        favoritesView.myCollectionView.reloadData()
        favoriteBooks = DataPersistenceModel.getFavoriteBooks()
    }
}
extension FavoritesVC : UICollectionViewDelegate, UICollectionViewDataSource {
  
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = favoritesView.myCollectionView.dequeueReusableCell(withReuseIdentifier: favCellId, for: indexPath) as! FavoriteCell
        let bookIWant = favoriteBooks[indexPath.row]
        cell.titleLabel.text = bookIWant.bookName
        cell.descriptionTextView.text = bookIWant.description
        if let image = UIImage(data: bookIWant.imageData) {
            cell.favoriteBookPhoto.image = image
        }
        return cell
    }
}

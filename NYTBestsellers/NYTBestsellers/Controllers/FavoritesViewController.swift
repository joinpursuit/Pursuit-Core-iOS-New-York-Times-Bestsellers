//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Kevin Waring on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    let favorites = FavoritesView()
    var favoriteBooks = DataPersistenceModel.getFavoriteBooks()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(favorites)
        favorites.myCollectionView.dataSource = self
        self.title = "Favorites (\(favoriteBooks.count))"
    }
    override func viewWillAppear(_ animated: Bool) {
        favorites.myCollectionView.reloadData()
        favoriteBooks = DataPersistenceModel.getFavoriteBooks()
    }
    func reload() {
        favoriteBooks = DataPersistenceModel.getFavoriteBooks()
        favorites.myCollectionView.reloadData()
    }
    @objc func buttonPressed(sender: UIButton) {
        let index = sender.tag
        let actionSheet = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        let delete = UIAlertAction(title: "Delete", style: .destructive) { (UIAlertAction) in
            DataPersistenceModel.deleteFavoriteBook(atIndex: index)
            self.reload()
        }
        actionSheet.addAction(delete)
        self.present(actionSheet, animated: true, completion: nil)
    }

    
}
extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as? FavoritesCollectionViewCell else {return UICollectionViewCell()}
        if let image = UIImage(data: favoriteBooks[indexPath.row].imageData){
            cell.bookImage.image = image
            
        }
        cell.bookLabel.text = favoriteBooks[indexPath.row].bookName
        cell.bookText.text = favoriteBooks[indexPath.row].description
        
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        return cell
    }
    
    
}

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
   
    private var favoriteBooks = [FavoriteBooks]() {
        didSet {
            navigationItem.title = "Favorites (\(favoriteBooks.count))"
            favoritesView.favoriteCollectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view = FavoritesView()
        loadFavorites()
        self.view.backgroundColor = .yellow
        self.view.addSubview(favoritesView)
        self.favoritesView.favoriteCollectionView.delegate = self
        self.favoritesView.favoriteCollectionView.dataSource = self
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFavorites()
    }
    
    func loadFavorites() {
        self.favoriteBooks = NYTBestsellersBookDataManager.fetchFavoriteBooksFromDocumentDirectory()
    }
    
}

extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(NYTBestsellersBookDataManager.fetchFavoriteBooksFromDocumentDirectory().count)
        return NYTBestsellersBookDataManager.fetchFavoriteBooksFromDocumentDirectory().count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCell", for: indexPath) as? FavoritesCollectionViewCell else { return UICollectionViewCell() }
        let favorite = NYTBestsellersBookDataManager.fetchFavoriteBooksFromDocumentDirectory()[indexPath.row]
        cell.bookImage.image = UIImage(data: favorite.imageData!)
        cell.authorLabel.text = favorite.author
        cell.descriptionField.text = favorite.description
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let deleAction = UIAlertAction(title: "Delete", style: .destructive) { alert in
            self.deleteFavorite(indexPath: indexPath)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(deleAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    private func deleteFavorite(indexPath: IndexPath) {
        let favoriteBook = favoriteBooks[indexPath.row]
        NYTBestsellersBookDataManager.delete(favoriteBook: favoriteBook, atIndex: indexPath.row)
        favoriteBooks = NYTBestsellersBookDataManager.fetchFavoriteBooksFromDocumentDirectory()
    }
}



//
//  FavoriteViewController.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    let favoriteView = FavoriteView()

    var favorites = FavoriteDataManager.fetchFavoriteBooksFromDocumentsDirectory() {
        didSet {
            DispatchQueue.main.async {
                self.favoriteView.favoriteCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(favoriteView)
        favoriteView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        favorites = FavoriteDataManager.fetchFavoriteBooksFromDocumentsDirectory().sorted { $0.timeStamp.date() > $1.timeStamp.date() }
        print(favorites.count.description + " favorite books")
    }
    
}

extension FavoriteViewController: FavoriteViewDelegate {
    func numberOfFavoriteBooks() -> Int {
        return favorites.count
    }
    
    func configureCollectionViewCell(indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favoriteView.favoriteCollectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCell else { return UICollectionViewCell() }
        let currentFavoriteBook = favorites[indexPath.row]
        cell.configureCell(favoriteBook: currentFavoriteBook, buttonTag: indexPath.row)
        cell.delegate = self
        return cell
    }
}

extension FavoriteViewController: FavoriteCellDelegate {
    func cellButtonPressed(tag: Int) {
        let currentFavoriteBook = favorites[tag]
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let delete = UIAlertAction(title: "Delete", style: .destructive) { (action) in
            FavoriteDataManager.delete(favoriteBook: currentFavoriteBook, atIndex: tag)
            self.favorites = FavoriteDataManager.fetchFavoriteBooksFromDocumentsDirectory()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        actionSheet.addAction(delete)
        actionSheet.addAction(cancel)
        present(actionSheet, animated: true, completion: nil)
    }
}

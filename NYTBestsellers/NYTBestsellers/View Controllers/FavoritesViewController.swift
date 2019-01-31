//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    let favoritesView = FavoritesView()
    var myBooks = [FavoriteBook]() {
        didSet {
            DispatchQueue.main.async {
                self.favoritesView.myFavoritesCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(favoritesView)
        favoritesView.myFavoritesCollectionView.dataSource = self
        favoritesView.myFavoritesCollectionView.delegate = self
        myBooks = FavoriteModel.getBooks()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myBooks = FavoriteModel.getBooks()
        favoritesView.myFavoritesCollectionView.reloadData()
    }
}
extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FavoriteModel.getBooks().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCollectionViewCell", for: indexPath) as? FavoritesCollectionViewCell else { return UICollectionViewCell()}
        let book = FavoriteModel.getBooks()[indexPath.row]
        cell.layer.cornerRadius = 20.0
        cell.cellButton.tag = indexPath.row
        cell.cellImage.image = UIImage(data: book.imageData)
        cell.cellLabel.text = book.author
        cell.cellTextView.text = book.description
        cell.delegate = self
        return cell
    }
}
extension FavoritesViewController: FavoritesCollectionViewCellDelegate {
    func actionSheet(tag: Int) {
        let optionMenu = UIAlertController(title: nil, message: "Options:", preferredStyle: .actionSheet)
        let  deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
            FavoriteModel.deleteBook(index: tag)
            self.favoritesView.myFavoritesCollectionView.reloadData()
        })
        let editAction = UIAlertAction(title: "See on Amazon", style: .default)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(editAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
}

//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var amazonLink = String()
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
        updateTitle()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myBooks = FavoriteModel.getBooks()
        favoritesView.myFavoritesCollectionView.reloadData()
        updateTitle()
    }
    private func updateTitle() {
        if self.myBooks.count > 0 {
            self.navigationItem.title = ("Favorites \(myBooks.count)")
        } else {
            self.navigationItem.title = "Favorites"
        }
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
        amazonLink = book.amazonLink
        print(amazonLink)
        return cell
    }
}
extension FavoritesViewController: FavoritesCollectionViewCellDelegate {
    func actionSheet(tag: Int) {
        let optionMenu = UIAlertController(title: nil, message: "Options:", preferredStyle: .actionSheet)
        let  deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
            FavoriteModel.deleteBook(index: tag)
            self.myBooks = FavoriteModel.getBooks()
            self.updateTitle()
            self.favoritesView.myFavoritesCollectionView.reloadData()
        })
        let amazonAction = UIAlertAction(title: "See on Amazon", style: .default, handler: { (action) -> Void in
            let amazonURlString = self.myBooks[tag].amazonLink
            guard let amazonURL = URL(string: amazonURlString) else {return}
            UIApplication.shared.open(amazonURL, options: [:], completionHandler: nil)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(amazonAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
}

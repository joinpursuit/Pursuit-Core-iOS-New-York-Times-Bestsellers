//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Donkemezuo Raymond Tariladou on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, AlertPresentingDelegate {
    func reloadData() {
        loadFavoriteBooks()
        self.favoriteBook.collectionView.reloadData()
    }
    
    func present(view: UIAlertController) {
        self.present(view, animated: true, completion: nil)
    }
    
    
    let favoriteBook = FavoriteView()
    
    var favoritedBooks = [FavoriteBook](){
        didSet {
            favoriteBook.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        self.view.addSubview(favoriteBook)
        favoriteBook.collectionView.dataSource = self
        favoriteBook.collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFavoriteBooks()
    }
    
  
    
    func loadFavoriteBooks(){
        favoritedBooks = FavoritedBookModel.getFavoritedBooks()
    }
}
extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoritedBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FCVCell", for: indexPath) as? FavoriteCollectionViewCell else  { return UICollectionViewCell() }
        cell.presenter = self
        let book = favoritedBooks[indexPath.row]
        ImageHelper.fetchImage(urlString: book.imageUrlStr) { (error, image ) in
            guard error == nil else { print(error.debugDescription); return }
            
            if let image = image {
                cell.imageView.image = image
            }
        }
        cell.label.text = "\(book.numberOfWeeksSpent) on best sellers list"
        cell.textView.text = book.description
        return cell
    }
}

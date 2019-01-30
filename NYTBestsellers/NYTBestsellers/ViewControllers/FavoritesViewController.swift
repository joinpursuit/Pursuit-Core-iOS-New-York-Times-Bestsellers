//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Donkemezuo Raymond Tariladou on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    let favoriteBook = FavoriteView()
    
    
    
    var favoritedBooks = [FavoriteBook](){
        didSet {
            favoriteBook.collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.view.addSubview(favoriteBook)
        favoriteBook.collectionView.dataSource = self
        favoriteBook.collectionView.delegate = self
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FCVCell", for: indexPath) as? FavoriteCollectionViewCell else {return UICollectionViewCell()}
let book = favoritedBooks[indexPath.row]
        cell.imageView.image = UIImage.init(data: book.Image)
        cell.label.text = "\(book.numberOfWeeksSpent)"
        cell.textView.text = book.description
        return cell
}
}

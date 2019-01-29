//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    let favoritesView = FavoritesView()
    var books = BookModel.getBook() {
        didSet{
            DispatchQueue.main.async {
                self.favoritesView.colloectionView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
         favoritesView.colloectionView.dataSource = self
        favoritesView.colloectionView.register(FavoritesCell.self, forCellWithReuseIdentifier: "Favorites")
        view.addSubview(favoritesView)
    }
    override func viewWillAppear(_ animated: Bool) {
        books = BookModel.getBook()
    }
    


}
extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Favorites", for: indexPath) as? FavoritesCell else { return UICollectionViewCell() }
        let book = books[indexPath.row]
        cell.label.text = book.author
        cell.image.image = UIImage(data: book.imageData)
        cell.textView.text = book.description
        return cell
    }
    
    
}

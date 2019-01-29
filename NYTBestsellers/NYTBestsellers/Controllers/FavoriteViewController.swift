//
//  FavoriteViewController.swift
//  NYTBestsellers
//
//  Created by Biron Su on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    let favoriteView = FavoriteView()

    var books = [Book]() {
        didSet{
            DispatchQueue.main.async {
                self.favoriteView.collectionView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(favoriteView)
        navigationItem.title = "Favorites"
        favoriteView.collectionView.dataSource = self
        getFavoriteBook()
    }
    override func viewWillAppear(_ animated: Bool) {
        getFavoriteBook()
    }
    func getFavoriteBook() {
        books = FavoriteBookModel.getBooks()
    }
}
extension FavoriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCollectionViewCell else {return UICollectionViewCell()}
        let cellToSet = books[indexPath.row]
        cell.bookText.text = cellToSet.book_details[0].description
        cell.bookLabel.text = "\(cellToSet.weeks_on_list) weeks on best sellers"
        return cell
    }
}

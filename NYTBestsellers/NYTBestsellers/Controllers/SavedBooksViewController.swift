//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SavedBooksViewController: UIViewController {
    
    let savedBooksView = SavedBooks()
    
    private var savedBooks = [SavedBook]() {
        didSet {
            savedBooksView.collectionView.reloadData()
        }
    }

    fileprivate func getBooks() {
        savedBooks = SavedBooksModel.getBooks()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(savedBooksView)
        navigationItem.title = "Favorited Books"
        savedBooksView.collectionView.dataSource = self
        getBooks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getBooks()
    }
    
    
    @objc func optionsButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "What would you like to do?", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
            SavedBooksModel.deleteBook(atIndex: sender.tag)
            self.getBooks()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}

extension SavedBooksViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = savedBooksView.collectionView.dequeueReusableCell(withReuseIdentifier: "SavedBooksCollectionViewCell", for: indexPath) as? SavedBooksCollectionViewCell else { return UICollectionViewCell() }
        let book = savedBooks[indexPath.row]
        cell.bookTitleAndAuthor.text = "\(book.title) by \(book.author)"
        cell.bookDescriptionLabel.text = book.shortDescription
        if let imageExists = book.bookImage {
            cell.bookImage.image = UIImage(data: imageExists)
        }
        cell.moreOptionsButton.tag = indexPath.row
        cell.moreOptionsButton.addTarget(self, action: #selector(optionsButtonPressed), for: .touchUpInside)
        return cell
    }
    
    
}

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
    
    private var savedBooks = [SavedBook]()

    fileprivate func getBooks() {
        savedBooks = SavedBooksModel.getBooks()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(savedBooksView)
        savedBooksView.collectionView.dataSource = self
        getBooks()
    }
    
//    private func optionsButtonPressed(_ sender: UIButton) {
//    let alert = UIAlertController(title: "", message: "What would you like to do with this journal entry?", preferredStyle: .actionSheet)
//    alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
//    self.deleteJournal(atIndex: sender.tag)
//    self.getPhotoJournals()
//    }))
//    alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: { (action) in
//    self.editJournal(atIndex: sender.tag)
//    }))
//    alert.addAction(UIAlertAction(title: "Share", style: .default, handler: { (action) in
//    self.shareJournal(atIndex: sender.tag)
//    }))
//    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//    present(alert, animated: true, completion: nil)
//    }

}

extension SavedBooksViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = savedBooksView.collectionView.dequeueReusableCell(withReuseIdentifier: "SavedBooksCollectionViewCell", for: indexPath) as? SavedBooksCollectionViewCell else { return UICollectionViewCell() }
        let book = savedBooks[indexPath.row]
        cell.bookTitleAndAuthor.text = "\(book.title) by \(book.author)"
        cell.bookDescriptionLabel.text = book.longDescription
        if let imageExists = book.bookImage {
            cell.bookImage.image = UIImage(data: imageExists)
        }
        return cell
    }
    
    
}

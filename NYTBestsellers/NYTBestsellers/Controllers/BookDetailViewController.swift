//
//  BookDetailViewController.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    let bookDetailView = BookDetailView()
    
    public var bookToSet: NYTBook?
    public var bookDetail = ""
    private var detailBookDescription = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bookDetailView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoriteButtonPressed))
        if let bookToSet = bookToSet {
            if let bookInfoExists = bookToSet.book_details.first, let imageData = bookToSet.bookGoogleImage {
                title = bookInfoExists.title
                bookDetailView.bookDetailTextView.text = bookToSet.bookLongDescription
                bookDetailView.bookImage.image = UIImage(data: imageData)
            }
        }
    }
    
    @objc func favoriteButtonPressed() {
        if let bookToSet = bookToSet {
            if let bookInfoExists = bookToSet.book_details.first, let imageData = bookToSet.bookGoogleImage, let bookLongDescription = bookToSet.bookLongDescription {
                let date = Date()
                let isoDateFormatter = ISO8601DateFormatter()
                isoDateFormatter.formatOptions = [.withFullDate,
                                                    .withFullTime,
                                                    .withInternetDateTime,
                                                    .withTimeZone,
                                                    .withDashSeparatorInDate]
                let timeStamp = isoDateFormatter.string(from: date)
                let bookToSave = SavedBook.init(title: bookInfoExists.title, author: bookInfoExists.author, shortDescription: bookInfoExists.bookShortDescription, longDescription: bookLongDescription, bookImage: imageData, amazonLink: bookToSet.amazon_product_url, isbn13: bookInfoExists.primaryISBN13, addedDate: timeStamp)
                    SavedBooksModel.addBook(book: bookToSave)
                let alert = UIAlertController(title: "Successfully favorited book", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }
    }

}
extension BookDetailViewController: BestSellersViewControllerDelegate {
    func sendOverBook(bookToSet: NYTBook) {
        self.bookToSet = bookToSet
    }
}

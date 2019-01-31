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
    
    public var bookToSet: SavedBook?
    
    init(book: SavedBook) {
        super.init(nibName: nil, bundle: nil)
        self.bookToSet = book
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bookDetailView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoriteButtonPressed))
        if let bookToSet = bookToSet {
            title = bookToSet.title
            bookDetailView.bookDetail.text = "\(bookToSet.title) by \(bookToSet.author) \n\nISBN:\(bookToSet.isbn13)\n\n\(bookToSet.longDescription)"
            if let imageData = bookToSet.bookImage {
                bookDetailView.bookImage.image = UIImage(data: imageData)
            } else {
                bookDetailView.bookImage.image = UIImage(named: "placeHolder")
            }
        }
        bookDetailView.amazonButton.addTarget(self, action: #selector(amazonButtonPressed), for: .touchUpInside)
    }
    
    @objc func amazonButtonPressed() {
//        if let bookToSet = bookToSet {
//            let linkToSend = bookToSet.amazonLink
//            let destination = AmazonLinkViewController(link: linkToSend)
//            navigationController?.pushViewController(destination, animated: true)
//        }
    }
    
    @objc func favoriteButtonPressed() {
        if var bookToSet = bookToSet {
            let date = Date()
            let isoDateFormatter = ISO8601DateFormatter()
            isoDateFormatter.formatOptions = [.withFullDate,
                                                .withFullTime,
                                                .withInternetDateTime,
                                                .withTimeZone,
                                                .withDashSeparatorInDate]
            let timeStamp = isoDateFormatter.string(from: date)
            bookToSet.addedDate = timeStamp
            SavedBooksModel.addBook(book: bookToSet)
            let alert = UIAlertController(title: "Successfully favorited book", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

}

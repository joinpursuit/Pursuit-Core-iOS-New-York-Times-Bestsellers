//
//  DetailViewController.swift
//  NYTBestsellers
//
//  Created by Biron Su on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let detailView = DetailView()
    var favoriteBook: Book!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        self.navigationItem.rightBarButtonItem = button1
    }
    init(book: Book) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = book.book_details[0].title
        favoriteBook = book
        updateUI(book: book)
        detailView.amazonButton.addTarget(self, action: #selector(amazonSegue), for: .touchUpInside)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func favorite() {
        FavoriteBookModel.addBook(book: favoriteBook)
    }
    @objc func amazonSegue() {
        
    }
    func updateUI(book: Book){
        DispatchQueue.main.async {
            self.detailView.bookText.text = book.book_details[0].description
            self.detailView.bookLabel.text = book.book_details[0].author
            GoogleAPIClient.getImage(keyword: book.book_details[0].primary_isbn13) { (error, info) in
                if let _ = error {
                    DispatchQueue.main.async {
                        self.detailView.bookImage.image = UIImage(named: "book")
                    }
                } else if let info = info {
                    DispatchQueue.main.async {
                        self.detailView.bookText.text = info[0].volumeInfo.description
                        ImageHelper.fetchImageFromNetwork(urlString: info[0].volumeInfo.imageLinks.thumbnail.absoluteString, completion: { (error, image) in
                            if let image = image {
                                DispatchQueue.main.async {
                                    self.detailView.bookImage.image = image
                                }
                            }
                        })
                    }
                }
            }
        }
    }
}

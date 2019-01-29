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
    var indexNumber: Int!
    var favoriteImage: URL!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        let rightBarbButton = UIBarButtonItem(customView: detailView.favoriteButton)
        self.navigationItem.rightBarButtonItem = rightBarbButton
    }
    init(book: Book) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = book.book_details[0].title
        favoriteBook = book
        updateUI(book: book)
        detailView.amazonButton.addTarget(self, action: #selector(amazonSegue), for: .touchUpInside)
        detailView.favoriteButton.addTarget(self, action: #selector(favoriteFunc), for: .touchUpInside)

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func favoriteFunc(sender: UIBarButtonItem){
        let alert = UIAlertController(title: "Favorite", message: "Save \"\(favoriteBook.book_details[0].title)\" to favorites?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            let description = self.favoriteBook.book_details[0].description
            let date = Date.getISOTimestamp()
            let bookFave = FavoriteBook.init(createdAt: date, description: description, weeks_on_list: self.favoriteBook.weeks_on_list, image: self.favoriteImage, link: self.favoriteBook.amazon_product_url, primary_isbn13: self.favoriteBook.book_details[0].primary_isbn13)
            FavoriteBookModel.addBook(book: bookFave)
            let alert2 = UIAlertController(title: "Favorited!", message: "\(self.favoriteBook.book_details[0].title) has been saved to Favorites!", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert2, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    @objc func amazonSegue() {
        let amazon = AmazonWebViewController()
        self.navigationController?.pushViewController(amazon, animated: true)
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
                        self.favoriteImage = info[0].volumeInfo.imageLinks.thumbnail
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

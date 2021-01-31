//
//  NYTDetailBestSellingController.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTDetailBestSellingController: UIViewController {
    
    let nYTDetailBestSellingView = NYTDetailBestSellingView()
    
    var nYTBook: NYTBook!
    var bookImage: UIImage?
    var bookDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(nYTDetailBestSellingView)
        configureNavBar()
        configureUI()
    }
    
    init (book: NYTBook, bookImage: UIImage?, bookDescription: String?) {
        super.init(nibName: nil, bundle: nil)
        self.bookImage = bookImage
        self.nYTBook = book
        self.bookDescription = bookDescription
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configureUI() {
        nYTDetailBestSellingView.bookTitleAndAuthorLabel.text = nYTBook.bookDetails[0].title + "\n" + nYTBook.bookDetails[0].author
        nYTDetailBestSellingView.bookDescriptionTextView.text = bookDescription == nil ?
            nYTBook.bookDetails[0].description : bookDescription
        if let bookImage = self.bookImage {
            nYTDetailBestSellingView.bookImageView.image = bookImage
        }
    }
    
    private func configureNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoriteBook))
        title = nYTBook.bookDetails[0].title
    }
    
    @objc private func favoriteBook() {
        guard !FavoriteDataManager.isFavorite(isbn: nYTBook.bookDetails[0].primaryIsbn13) else {
            showAlert(title: "Book already favorited 🙂", message: nil)
            return
        }
        let imageData = bookImage?.jpegData(compressionQuality: 0.5)
        let favoriteBook = FavoriteBook.init(bookDetails: nYTBook, imageData: imageData, timeStamp: Date.getISOTimestamp())
        FavoriteDataManager.saveToDocumentDirectory(newFavoriteBook: favoriteBook) { (success, error) in
            if let error = error {
                print("Fail to Favorite: \(error)")
                showAlert(title: "Fail To Favorite", message: "\(error)")
            } else if let _ = success {
                showAlert(title: "Book Favorited 😀", message: nil)
            }
        }
        print(FavoriteDataManager.fetchFavoriteBooksFromDocumentsDirectory().count.description + " books favorited.")
    }
}

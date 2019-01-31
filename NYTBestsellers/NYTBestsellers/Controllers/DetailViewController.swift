//
//  DetailViewController.swift
//  NYTBestsellers
//
//  Created by Kevin Waring on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var bookDescription = String()
    var bookName = String()
    var author = String()
    var isbn = String()
    let detailVC = DetailView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailVC)
        self.title = self.bookName
        let favoriteButton = UIBarButtonItem.init(title: "Favorite", style: .plain, target: self, action: #selector(favoriteButtonPressed))
        self.navigationItem.rightBarButtonItem = favoriteButton
        detailVC.bookLabel.text = author
        APIClient.getGoogleData(isbn: isbn) { (appError, data) in
            if let appError = appError {
                print(appError)
            }
            if let data = data {
                DispatchQueue.main.async {
                    self.detailVC.bookText.text = data[0].volumeInfo.description
                    ImageHelper.fetchImageFromNetwork(urlString: data[0].volumeInfo.imageLinks.thumbnail.absoluteString, completion: { (appError, image) in
                        if let appError = appError {
                            print(appError)
                            
                        }
                        if let image = image {
                            self.detailVC.bookImage.image = image
                        }
                    })
                }
                
            }
            
        }
        
    }
    @objc func  favoriteButtonPressed() {
    let timeStamp = Date.getISOTimestamp()
        if let image = self.detailVC.bookImage.image {
            if let imageData = image.jpegData(compressionQuality: 0.5){
             let favoriteBook = FavoritedBook.init(bookName: self.bookName , favoritedAt: timeStamp, imageData: imageData, description: self.bookDescription)
                DataPersistenceModel.favoriteBook(favoriteBook: favoriteBook)
                
            }
            
            
        }
        let alert = UIAlertController.init(title: "Book Saved To Favorites", message: nil, preferredStyle: .alert)
        let okay = UIAlertAction.init(title: "Okay", style: .default) { (UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okay)
        self.present(alert, animated: true, completion: nil)
    }
    

    init(isbn: String, author: String, bookName: String, description: String) {
        super.init(nibName: nil, bundle: nil)
        self.isbn = isbn
        self.author = author
        self.bookName = bookName
        self.bookDescription = description
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

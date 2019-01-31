//
//  BestSellerDetailVC.swift
//  NYTBestsellers
//
//  Created by Joshua Viera on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerDetailVC: UIViewController {
    
    var bestSellerDetailView = BestSellerDetailView()
    var isbnString = ""
    var descriptionString = ""
    var bookString = ""
    var authorString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bestSellerDetailView)
        setUpData()
        setupUI()
    }
    
    
    init(isbn: String, description: String, book: String, author: String) {
        super.init(nibName: nil, bundle: nil)
        self.isbnString = isbn
        self.descriptionString = description
        self.bookString = book
        self.authorString = author
    }
    
    func setupUI() {
        let favoriteButton = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favButtonWasPressed))
        self.navigationItem.rightBarButtonItem = favoriteButton
    }
    
    @objc func favButtonWasPressed() {
        if let image = bestSellerDetailView.photoOfBook.image{
            let timeStamp = Date.getISOTimestamp()
            if let imageData = image.jpegData(compressionQuality: 0.5){
                let favBook = FavoriteBooks.init(bookName: self.bookString, favoritedAt: timeStamp, imageData: imageData, description: descriptionString)
                DataPersistenceModel.favoriteBook(favoriteBook: favBook)
            }
        }
    }
    
    
    func setUpData(){
        bestSellerDetailView.bookTitle.text = bookString
        APIClient.getGoogleData(isbn: isbnString) { (error, image) in
            if let error = error {
                self.bestSellerDetailView.photoOfBook.image = UIImage(named: "imageHolder")
                self.bestSellerDetailView.myTextView.text = self.descriptionString
                print(error)
            }
            if let image = image {
                DispatchQueue.main.async {
                    self.bestSellerDetailView.myTextView.text = image[0].volumeInfo.description
                }
                ImageHelper.fetchImageFromNetwork(urlString: image[0].volumeInfo.imageLinks.thumbnail, completion: { (error, photo) in
                    if let error = error {
                        print(error)
                    }
                    if let photo = photo {
                        self.bestSellerDetailView.photoOfBook.image = photo
                    }
                })
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

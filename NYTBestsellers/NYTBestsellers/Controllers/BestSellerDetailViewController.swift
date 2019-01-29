//
//  BestSellerDetailViewController.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerDetailViewController: UIViewController, ButtonDelegate {

    
    
    let detailVC = DetailView()
    var isbn = String()
    var bookDescription = String()
    var bookTitle = String()
    var amazonLink: URL!
    var author = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailVC)
        updateUI(isbn: isbn)
        title = bookTitle
        // Do any additional setup after loading the view.
    }
    
    func updateUI(isbn: String){
        detailVC.delegate = self
        let favButton = UIBarButtonItem.init(title: "Favorite", style: .plain, target: self, action: #selector(favButtonPressed))
        favButton.tintColor = .red
        self.navigationItem.rightBarButtonItem = favButton
        detailVC.bookLabel.text = author
        APIClient.getGoogleData(isbn: isbn) { (appError, data) in
            if let appError = appError {
                print(appError)
                DispatchQueue.main.async {
                    self.detailVC.detailBookImage.image = UIImage(named: "bookPlaceholder")
                    self.detailVC.detailBookTextView.text = self.bookDescription
                }
            }
            if let data = data{
                DispatchQueue.main.async {
                    self.detailVC.detailBookTextView.text = data[0].volumeInfo.description
                }
                if let image = ImageHelper.fetchImageFromCache(urlString: data[0].volumeInfo.imageLinks.thumbnail){
                    DispatchQueue.main.async {
                        self.detailVC.detailBookImage.image = image
                    }
                } else {
                    ImageHelper.fetchImageFromNetwork(urlString: data[0].volumeInfo.imageLinks.thumbnail) { (appError, image) in
                        if let appError = appError {
                            print(appError.errorMessage())
                        } else if let image = image{
                            self.detailVC.detailBookImage.image = image
                            
                        }
                    }
                }
            }
        }
    }

    func amazonButtonPressed() {
        let amazonVC = AmazonViewController()
        amazonVC.modalPresentationStyle = .overCurrentContext
        amazonVC.amazonURL = amazonLink
        self.present(amazonVC, animated: true, completion: nil)
        
    }
    @objc func favButtonPressed(){
        UIView.animate(withDuration: 2, delay: 0, options: [], animations: {
            self.detailVC.detailBookImage.frame.origin.y += self.view.bounds.height
        
        }) { (Done) in
            let timeStamp = Date.getISOTimestamp()
            //        let favoritedAt = timeStamp.date()
            if let image = self.detailVC.detailBookImage.image{
                if let imageData = image.jpegData(compressionQuality: 0.5){
                    let favoriteBook = FavoriteBook.init(bookName: self.bookTitle, favoritedAt: timeStamp, imageData: imageData, description: self.bookDescription, amazonURL: self.amazonLink)
                    DataPersistenceModel.favoriteBook(favoriteBook: favoriteBook)
//                    let alert = UIAlertController.init(title: "Book Saved To Favorites", message: nil, preferredStyle: .alert)
//                    let okay = UIAlertAction.init(title: "Okay", style: .default) { (UIAlertAction) in
//                        self.dismiss(animated: true, completion: nil)
//                    }
//                    alert.addAction(okay)
//                    self.present(alert, animated: true, completion: nil)
                }
        }

        }
        
    }
    init(isbn: String, description: String, bookName: String, bookAuthor: String,amazonLink: URL, author: String) {
        super.init(nibName: nil, bundle: nil)
        self.isbn = isbn
        self.bookDescription = description
        self.bookTitle = bookName
        self.amazonLink = amazonLink
        self.author = author
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

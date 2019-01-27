//
//  BestSellerDetailViewController.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerDetailViewController: UIViewController {
    
    let detailVC = DetailView()
    var isbn = String()
    var bookDescription = String()
    var bookTitle = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailVC)
        updateUI(isbn: isbn)
        // Do any additional setup after loading the view.
    }
    
    func updateUI(isbn: String){
        let favButton = UIBarButtonItem.init(title: "Favorite", style: .plain, target: self, action: #selector(favButtonPressed))
        favButton.tintColor = .red
        self.navigationItem.rightBarButtonItem = favButton
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
                    self.detailVC.detailBookImage.image = image
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
    
    @objc func favButtonPressed(){
        
        let timeStamp = Date.getISOTimestamp()
//        let favoritedAt = timeStamp.date()
        if let image = detailVC.detailBookImage.image{
            if let imageData = image.jpegData(compressionQuality: 0.5){
            let favoriteBook = FavoriteBook.init(bookName: bookTitle, favoritedAt: timeStamp, imageData: imageData)
            DataPersistenceModel.favoriteBook(favoriteBook: favoriteBook)
            let alert = UIAlertController.init(title: "Book Saved To Favorites", message: nil, preferredStyle: .alert)
            let okay = UIAlertAction.init(title: "Okay", style: .default) { (UIAlertAction) in
                    self.dismiss(animated: true, completion: nil)
                }
            alert.addAction(okay)
            present(alert, animated: true, completion: nil)
            }
        }
        
    }
    init(isbn: String, description: String, bookName: String, bookAuthor: String) {
        super.init(nibName: nil, bundle: nil)
        self.isbn = isbn
        self.bookDescription = description
        
        
        
//        detailView.myLabel.text = message
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

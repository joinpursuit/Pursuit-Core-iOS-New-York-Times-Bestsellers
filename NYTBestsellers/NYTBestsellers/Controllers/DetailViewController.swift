//
//  DetailViewController.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate {

    let detailView = DetailView()
    var bookDescription = String()
    var weeks = Int()
    var amazonLink: URL!
    var urlString = String()
    var bookTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        navigationItem.title = "\(bookTitle)"
        let saveButton = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(DetailViewController.saveToFave(_:)))
        self.navigationItem.rightBarButtonItem = saveButton

    }
    
    init(isbn: String, author: String, description: String, weeks: Int, amazonLink: URL, bookTitle: String) {
        super.init(nibName: nil, bundle: nil)
        setupDetail(isbn: isbn, author: author, description: description, weeks: weeks, amazonLink: amazonLink, bookTitle: bookTitle)
        self.bookDescription = description
        self.weeks = weeks
        self.amazonLink = amazonLink
        self.bookTitle = bookTitle
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @objc func showLink() {
        urlString = amazonLink.absoluteString
        if let url = URL(string: urlString) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
    
    
    @objc func saveToFave(_ sender:UIBarButtonItem!) {
        let alert = UIAlertController.init(title: "Saved", message: "Book Saved To Favorites", preferredStyle: .alert)
        let okay = UIAlertAction.init(title: "Okay", style: .default) { (UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okay)
        present(alert, animated: true, completion: nil)
        if let image = detailView.bookImage.image {
            let timestamp = Date.getISOTimestamp()
            
            guard let imageData = image.jpegData(compressionQuality: 0.5) else {return print("No ImageData")}
            let favoriteBook = FavoriteBooks.init(bookImage: imageData, weeksOnBS: weeks, desciption: bookDescription, createdAt: timestamp, amazonLink: amazonLink)
            DataPersistenceModel.saveBook(book: favoriteBook)
        }
    }
    
    func setupDetail(isbn: String, author: String, description: String, weeks: Int, amazonLink: URL, bookTitle: String) {
        detailView.bookLabel.text = author
        detailView.bookTextView.text = description
        detailView.amazonButton.addTarget(self, action: #selector(showLink), for: .touchUpInside)
        GoogleAPIClient.getBookImages(keyword: isbn) { (error, data) in
            if let error = error {
                DispatchQueue.main.async {
                    self.detailView.bookImage.image = UIImage(named: "bookplaceholder")
                }
                print(error.errorMessage())
            } else if let data = data {
                DispatchQueue.main.async {
                    self.detailView.bookTextView.text = data[0].volumeInfo.description
                    
                }
                ImageHelper.fetchImageFromNetwork(urlString: data[0].volumeInfo.imageLinks.thumbnail.absoluteString, completion: { (error, image) in
                    if let error = error {
                        print(error.errorMessage())
                    } else if let image = image {
                        DispatchQueue.main.async {
                            self.detailView.bookImage.image = image
                        }
                    }
                })
            }
        }
    }
}

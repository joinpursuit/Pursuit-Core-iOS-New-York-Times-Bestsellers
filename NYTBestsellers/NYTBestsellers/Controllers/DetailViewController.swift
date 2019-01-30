//
//  DetailViewController.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
 let detailView = DetailView()
    var theBooks: BookResults!
    var book: Book?
    var bookIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Favorite", style: .plain, target: self, action: #selector(favorite))
        detailView.label.text = theBooks.book_details.first?.author
        
        
        APIClient.getGoogleImage(keyword: (theBooks.book_details.first?.primary_isbn13)!) { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                DispatchQueue.main.async {
                    self.detailView.textView.text = data.description

                }
                ImageHelper.fetchImageFromNetwork(urlString: data.imageLinks.smallThumbnail){ (error, image) in
                    if let error = error {
                        print(error.errorMessage())
                    }
                    if let image = image {
                        self.detailView.image.image = image
                    }
                }
                
            }
        }
        
    }
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    @objc private func favorite(){
        let date = Date()
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withFullDate,
                                          .withFullTime,
                                          .withInternetDateTime,
                                          .withTimeZone,
                                          .withDashSeparatorInDate]
        let timestamp = isoDateFormatter.string(from: date)
        if let image = detailView.image.image, let text = detailView.textView.text{
            if let imageData = image.jpegData(compressionQuality: 0.5){
                let bookFavorites = Book.init(weeks_on_list: theBooks!.weeks_on_list, author: (theBooks.book_details.first?.author)!, imageData: imageData, description: text, createdAt: timestamp)
                if book == nil {
                    BookModel.addBook(book: bookFavorites)
                    showAlert(title: "Succesfully Favorited Book", message: "")
                } else {
                    BookModel.updateItem(updatedItem: bookFavorites, atIndex: bookIndex!)
                }
            }
        }
        dismiss(animated: true, completion: nil)
    }
     
    
}

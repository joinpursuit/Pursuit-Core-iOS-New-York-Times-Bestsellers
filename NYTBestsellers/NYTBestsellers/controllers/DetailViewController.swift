//
//  DetailViewController.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
    let detailview = DetailView()
    public var book: BookResults!
    var imageData: Data?
    var bookTitle = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailview)
        title = "Detail"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Favorite", style: .plain, target: self, action: #selector(addToFavorite))
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        }
    
    @objc private func addToFavorite() {
        if let title = detailview.detailLabel.text {
            self.bookTitle = title
        }
        guard !BookDataManager.isFavorite(id: bookTitle) else {
            showAlert(title: "Duplicate", message: "\(String(describing: title)) already exists in your favorites.")
            return
        }
            
        if let image = detailview.detailImage.image {
        imageData = image.jpegData(compressionQuality: 0.5)
        }
        
        let favoriteBook = FavoriteBooks.init(bookName: bookTitle, imageData: imageData!, description: detailview.detailTextView.text)
        let favedStatus = BookDataManager.saveToDocumentDirectory(newFavoriteEvent: favoriteBook)
        if let error = favedStatus.error {
            showAlert(title: "saving error", message: "error saving \(error.localizedDescription)")
        } else {
            showAlert(title: "", message: "\(self.detailview.detailLabel.text!) added to favorites")
        }
    }
    
}


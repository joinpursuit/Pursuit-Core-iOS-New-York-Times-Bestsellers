//
//  DetailViewController.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    

    let detailView = DetailView()
    
    var googleInfo: BookInfo?
    
    var bookImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailView)
        self.view.backgroundColor = .lightGray
        configureDetailView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(addToFavorites))
      
    }
    @objc private func addToFavorites() {
        let current = Date.getISOTimestamp()
        if let imageData = bookImage {
          let faveImage = imageData.jpegData(compressionQuality: 0.5)
             let favoriteBook = FavoriteBook.init(bookName: googleInfo!.volumeInfo.title, favoritedAt: current , imageData: faveImage, description: googleInfo!.volumeInfo.description)
            BookDataManager.saveToDocumentDirectory(newFavoriteBook: favoriteBook)
            print("I favorited a book")
        }
        
        }

    
    func configureDetailView() {
        if let image = bookImage {
            detailView.bookImage.image = image
            
        }
       
        if let googleInfo = googleInfo {
            detailView.bookAuthor.text = googleInfo.volumeInfo.authors.first!
            detailView.bookDescription.text = googleInfo.volumeInfo.description
            navigationItem.title = googleInfo.volumeInfo.title
        }
      
    
    }
}

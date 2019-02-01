//
//  NYTBestsellersDetailViewController.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/30/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTBestsellersDetailViewController: UIViewController {
    
    let NYTbestsellerdetailView = NYTBestsellerDetailView()
    
    var googleInfo: ItemDetails?
    
    //var bookDetails = [BookData]()
    var bookDetails: BookData?
    var bookImage: UIImage? 

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(NYTbestsellerdetailView)
        self.view.backgroundColor = .red
        configureDetailView()
       // navigationItem.title = "\(String(describing: bookDetails.first?.list_name))"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(addToFavorites))
        
    }
    
    func configureDetailView() {
        if let image = bookImage {
            NYTbestsellerdetailView.bookImage.image = image
            
        }
        if let googleInfo = googleInfo {
            navigationItem.title = googleInfo.volumeInfo.title
            NYTbestsellerdetailView.bookAuthor.text = googleInfo.volumeInfo.authors[0]
            NYTbestsellerdetailView.bookDescription.text = googleInfo.volumeInfo.description
        }
      
    }
    
    @objc private func addToFavorites() {
        if let title = self.navigationItem.title, let description = self.bookDetails?.book_details[0].description {
        let alertController = UIAlertController(title: "Add to favorites", message: "Saved", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        let data = bookImage?.jpegData(compressionQuality: 0.5)
            
        let favorite = FavoriteBooks.init(author: "String", imageData: data, description: description)
            NYTBestsellersBookDataManager.saveToDocumentDirectory(newFavoriteBook: favorite)
            
        }
    }
}
    



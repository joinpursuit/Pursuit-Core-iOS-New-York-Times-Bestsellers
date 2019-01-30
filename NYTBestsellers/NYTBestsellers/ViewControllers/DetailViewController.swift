//
//  DetailViewController.swift
//  NYTBestsellers
//
//  Created by Donkemezuo Raymond Tariladou on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    let detailView = DetailView()
    private var book: BookDetailsAndCredentials!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailView)
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Favorite", style: .plain, target: self, action: #selector(bookFavorited))
    
       
        
     
    }
   
   init(book: BookDetailsAndCredentials) {
    super.init(nibName: nil, bundle: nil)
    self.book = book
    setUpDetailView()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpDetailView(){
        
        if let bookISBNS = book.isbns.first?.isbn13 {
            BookAPIClient.BookCoverImage(Isbn: bookISBNS) { (error, data) in
                if let error = error {
                    print("Error: \(error)")
                } else if let bookDetails = data {
                
                        DispatchQueue.main.async {
                              self.detailView.textView.text = bookDetails.description
                        }
                  
                    ImageHelper.fetchImageFromNetwork(urlString: bookDetails.imageLinks.thumbnail, completion: { (error, image) in
                        if let error = error {
                            print("Invalid image with error: \(error)")
                        } else if let imageData = image {
                            self.detailView.imageView.image = imageData
                            
                        }
                    })
                }
            }
        }
    
   
    }
    
    
    func alert (){
        let alert = UIAlertController(title: "Favorite", message: "Successfully added book to favorite books collection", preferredStyle: .alert)
        let favorited = UIAlertAction.init(title: "Favorited Books", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
            let favoritesVC = FavoritesViewController()
            self.navigationController?.pushViewController(favoritesVC, animated: true)
            
        }
        
        let back = UIAlertAction.init(title: "Go Back", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
            let mainVC = MainViewController()
        self.navigationController?.pushViewController(mainVC, animated: true)
            
        }
        
    alert.addAction(favorited)
    alert.addAction(back)
        present(alert, animated: true , completion: nil)
        
        
    }

    
    @objc func bookFavorited(){
        alert()
    }
    
    private func favoriteBook(bookCover: UIImage){
        
        if let imageData = bookCover.jpegData(compressionQuality: 0.5){
            
            let bookK = FavoriteBook.init(numberOfWeeksSpent: book.weeks_on_list, Image: imageData, description: book.book_details.first!.description ?? "")
            FavoritedBookModel.favorite(Book: bookK)
        }
        
    }
 

}

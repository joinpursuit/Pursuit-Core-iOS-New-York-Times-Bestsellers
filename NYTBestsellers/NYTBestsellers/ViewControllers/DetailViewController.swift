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
        view.backgroundColor = .white
     
    }
   
   init(book: BookDetailsAndCredentials) {
    super.init(nibName: nil, bundle: nil)
    self.book = book
  
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
 
    
    @objc func bookFavorited(){
        alert()
    }
    
    func alert (){
        // Save the image
        let imageUrlStr = BookAPIClient.BookCoverImageUrl(Isbn: book.isbns.first!.isbn13)
        if let image = self.detailView.imageView.image {
            ImageHelper.saveImageToDisk(image: image, imageUrl: imageUrlStr)
        }
        
        // Save the FavoriteBook
        let bookToFavorite = FavoriteBook.init(numberOfWeeksSpent: book.weeks_on_list,
                                               imageUrlStr: imageUrlStr,
                                               description: book.book_details.first!.description ?? "")
        
        FavoritedBookModel.favorite(Book: bookToFavorite)

        //Display Alert
        
        let alert = UIAlertController(title: "Favorite", message: "Successfully added book to favorite books collection", preferredStyle: .alert)
        let back = UIAlertAction.init(title: "Ok", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(back)
        present(alert, animated: true , completion: nil)
    }
}

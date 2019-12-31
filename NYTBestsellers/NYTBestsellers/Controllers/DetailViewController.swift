//
//  DetailViewController.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController {
    
    let detailView = DetailView()
    var theBooks: BookResults!
    var book: Book?
    var bookIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        detailView.delegate = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Favorite", style: .plain, target: self, action: #selector(favorite))
        detailView.label.text = theBooks.book_details.first?.author
        
        APIClient.getGoogleImage(keyword: (theBooks.book_details.first?.primary_isbn13)!) { (result) in
        switch result{
        case .failure(let error):
          DispatchQueue.main.async {
            print(error)
          }
        case .success(let data):
          DispatchQueue.main.async {
            self.detailView.textView.text = data?.description
            self.detailView.image.getImage(with: (data?.imageLinks.smallThumbnail)!) { (result) in
              switch result{
              case .failure(let error):
                print(error)
              case .success(let image):
                DispatchQueue.main.async {
                self.detailView.image.image = image
                }
              }
            }
          }
          
        }
      }
      
        
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
                if bookFavorites.description == BookModel.getBook().first?.description {
                    alreadyFavorited(title: "You already Favorited this item!", message: "Will not duplicate!")
                } else {
                    BookModel.addBook(book: bookFavorites)
                    showAlert(title: "Succesfully Favorited Book", message: "")
                }
                
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    
}
extension DetailViewController: DetailViewDelegate {
 
  
  func amazonPressed() {
    guard let urlString = theBooks.amazon_product_url else {return}
    guard let url = URL(string: urlString) else {return}
    print(url)
    let safariVC = SFSafariViewController(url: url)
    present(safariVC, animated: true, completion: nil)

  }
  
}

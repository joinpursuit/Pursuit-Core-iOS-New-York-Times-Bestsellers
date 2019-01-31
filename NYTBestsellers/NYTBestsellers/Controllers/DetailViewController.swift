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
    
    var bookDetails: BookData?
    var bookImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailView)
        self.view.backgroundColor = .red
        configureDetailView()
//       navigationItem.title = "\(String(describing: googleInfo?.volumeInfo.))"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(addToFavorites))
      
    }
    @objc private func addToFavorites() {
        
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

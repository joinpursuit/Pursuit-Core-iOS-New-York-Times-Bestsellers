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
    
    var googleInfo = [BookInfo]()
    
    var bookDetails = [BookData]() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailView)
        self.view.backgroundColor = .red
        navigationItem.title = "\(String(describing: bookDetails.first?.listName))"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(addToFavorites))
      
    }
    @objc private func addToFavorites() {
        
    }
}

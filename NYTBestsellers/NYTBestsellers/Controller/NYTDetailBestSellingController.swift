//
//  NYTDetailBestSellingController.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTDetailBestSellingController: UIViewController {
    
    let nYTDetailBestSellingView = NYTDetailBestSellingView()
    
    var nYTBook: NYTBook!
    var bookImage: UIImage?
    var bookDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(nYTDetailBestSellingView)
        configureNavBar()
        configureUI()
    }
    
    init (book: NYTBook, bookImage: UIImage?, bookDescription: String?) {
        super.init(nibName: nil, bundle: nil)
        self.bookImage = bookImage
        self.nYTBook = book
        self.bookDescription = bookDescription
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configureUI() {
        nYTDetailBestSellingView.bookTitleLabel.text = nYTBook.bookDetails[0].title
        nYTDetailBestSellingView.bookDescriptionTextView.text = bookDescription == nil ?
            nYTBook.bookDetails[0].description : bookDescription
        if let bookImage = self.bookImage {
            nYTDetailBestSellingView.bookImageView.image = bookImage
        }
    }
    
    private func configureNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoriteBook))
    }
    
    @objc private func favoriteBook() {
        
    }
}

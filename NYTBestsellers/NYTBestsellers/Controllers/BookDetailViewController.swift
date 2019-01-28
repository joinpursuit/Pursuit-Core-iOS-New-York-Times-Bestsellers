//
//  BookDetailViewController.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    let bookDetailView = BookDetailView()
    
    public var bookList: BookList?

    override func viewDidLoad() {
        super.viewDidLoad()
        print(bookList?.book_details as Any)
        view.addSubview(bookDetailView)
        bookDetailView.navigationItem.title = bookList?.book_details.first?.title
    }
    


}

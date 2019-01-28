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
    
    public var bookToSet: NYTBook?
    public var bookDetail: BookDetail?
    private var detailBookDescription = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bookDetailView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(actionHere))
        if let bookToSet = bookToSet {
            if let infoExists = bookToSet.book_details.first {
                bookDetail = infoExists
            }
        }
        title = bookDetail?.title
        bookDetailView.bookDetailTextView.text = bookDetail?.bookDescription
    }
    
    @objc func actionHere() {
        print("fav button pressed")
    }

}
extension BookDetailViewController: BestSellersViewControllerDelegate {
    func sendOverBook(bookToSet: NYTBook, detailBookDescription: String) {
        self.bookToSet = bookToSet
        self.detailBookDescription = detailBookDescription
    }
}

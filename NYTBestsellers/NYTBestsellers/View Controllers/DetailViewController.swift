//
//  DetailViewController.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    //lazy var book
    //when saving a book, tab bar stuff. 

    let detailView = DetailView()
    private var animator: UIViewPropertyAnimator!
    var durationTime = Double()
    var favoriteBook: FavoriteBook?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailView)
        print(detailView.detailLabel)
        detailView.delegate = self
//        animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut, animations: {
//            self.detailView.detailImage.transform = CGAffineTransform(scaleX: 10.0, y: 10.0)
//            self.durationTime = self.animator.duration
//            print(self.durationTime)
//        })

        navigationItem.rightBarButtonItem = detailView.favoriteButton
        
    }
    private func saveBook()-> FavoriteBook? {
        guard let image = detailView.detailImage.image,
            let author = detailView.detailLabel.text,
        let description = detailView.detailTextView.text else {return nil}

        let amazonLink = "Amazon"
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        formatter.timeStyle = .medium
        let timestamp = formatter.string(from: date)
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return nil}
        let favoriteBook = FavoriteBook.init(imageData: imageData, author: author, description: description, createdAt: timestamp, amazonLink: amazonLink)
        return favoriteBook
    }
    
    
//    init() {
//        super.init(nibName: nil, bundle: nil)
////        detailView.detailLabel.text = "Label"
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}
extension DetailViewController: DetailViewDelegate {
    func favoritePressed() {
        
        if favoriteBook != nil {
            if let book =  saveBook() {
                print("Book saved already")
            }
        } else {
            guard let book = saveBook() else {return}
            FavoriteModel.appendBook(favorite: book)
        }
        detailView.detailFavoritesImage.isHidden = false
        navigationItem.rightBarButtonItem?.isEnabled = false
        self.detailView.detailFavoritesImage.alpha = 1.0
//        UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
//            self.detailView.detailFavoritesImage.frame.origin.y += self.view.bounds.height
//            self.detailView.detailFavoritesImage.alpha = 1.0
//        })
        UIView.animate(withDuration: 1.0, delay: 0.5, options: [.curveEaseInOut], animations: {
//            self.detailView.detailFavoritesImage.alpha = 1.0

            self.detailView.detailFavoritesImage.frame.origin.y += self.view.bounds.height
            self.detailView.detailFavoritesImage.alpha = 0.0
        })
        
        
        
//        UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
//            self.detailView.detailImage.frame.origin.y += self.view.bounds.height
//            self.animator.fractionComplete = CGFloat(self.durationTime)
//
////            self.detailView.detailImage.transform = CGAffineTransform(scaleX: 10.0, y: 10.0)
//            self.detailView.detailImage.alpha = 0.0
//        }) { (done) in
//            //cleanup or reseting values after animation is complete
//            self.detailView.detailImage.frame.origin.y -= self.view.bounds.height
//            self.detailView.detailImage.transform = CGAffineTransform.identity
//            self.detailView.detailImage.alpha = 1.0
//        
//        }
    }
}

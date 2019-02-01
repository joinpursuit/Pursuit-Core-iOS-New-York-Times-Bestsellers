//
//  DetailViewController.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let detailView = DetailView()
    private var animator: UIViewPropertyAnimator!
    var durationTime = Double()
    var favoriteBook: FavoriteBook?
    var selectedTitle: String?
    var amazonLinkString: String?
    var myBooks = [FavoriteBook]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailView)
        detailView.delegate = self
        myBooks = FavoriteModel.getBooks()
        navigationItem.title = selectedTitle
        navigationItem.rightBarButtonItem = detailView.favoriteButton
        guard let titleSelected = selectedTitle else {return}
        if FavoriteModel.bookAlreadyFavorited(newTitle: titleSelected) {
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        guard let titleSelected = selectedTitle else {return}
        if FavoriteModel.bookAlreadyFavorited(newTitle: titleSelected) {
            navigationItem.rightBarButtonItem?.isEnabled = false
            
        } else {
            navigationItem.rightBarButtonItem?.isEnabled = true
//            detailView.detailFavoritesImage.isHidden = false
            

        }
    }
    private func animatedSave() {
        detailView.detailFavoritesImage.isHidden = false
        navigationItem.rightBarButtonItem?.isEnabled = false
        self.detailView.detailFavoritesImage.alpha = 0.0
        UIView.animateKeyframes(withDuration: 3.0, delay: 0.0, options: [.calculationModeLinear], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.detailView.detailFavoritesImage.alpha = 1.0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 1.0, animations: {
                self.detailView.detailFavoritesImage.frame.origin.y += self.view.bounds.height
                self.detailView.detailFavoritesImage.alpha = 0.0
            })
        }){ (done) in
            self.detailView.detailFavoritesImage.frame.origin.y -= self.view.bounds.height
            self.detailView.detailFavoritesImage.isHidden = true
        }
    }
    private func saveBook()-> FavoriteBook? {
        guard let image = detailView.detailImage.image,
            let author = detailView.detailLabel.text,
        let description = detailView.detailTextView.text else {return nil}
        guard let title = selectedTitle,
        let amazonLink = amazonLinkString else {return nil}
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        formatter.timeStyle = .medium
        let timestamp = formatter.string(from: date)
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return nil}
        let favoriteBook = FavoriteBook.init(imageData: imageData, author: author, description: description, createdAt: timestamp, amazonLink: amazonLink, title: title)
        return favoriteBook
    }
}
extension DetailViewController: DetailViewDelegate {
    func favoritePressed() {
        guard let title = selectedTitle else {return}
        if FavoriteModel.bookAlreadyFavorited(newTitle: title) {
            print("Book saved already")
        } else {
            guard let book = saveBook() else {return}
            FavoriteModel.appendBook(favorite: book)
            animatedSave()
        }
    }
    func amazonPressed() {
        guard let amazonURlString = amazonLinkString else {return}
        guard let amazonURL = URL(string: amazonURlString) else {return}
        UIApplication.shared.open(amazonURL, options: [:], completionHandler: nil)
    }
}

//
//  DetailViewController.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let detailView = DetailView()
    
    public var googleImage: Google?
    public var book: Books?
    public var detailBookImageView: UIImage?
    public var DetailDescription: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()

        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.view.addSubview(detailView)
        
        detailView.authorName.text = book?.bookDetails.first?.author
        detailView.bookDescription.text = book?.bookDetails.first?.googleDescription
    }
    
    private func configureNavBar() {
        // set navigation bar title
        navigationItem.title = book?.bookDetails.first?.title
        
        // setup right bar button item to "Favorite"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(addToFavorite))
    }

    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func addToFavorite() {
        // don't add duplicates
//        guard !EventDataManager.isFavorite(id: event.id) else {
//            showAlert(title: "Duplicate", message: "\(event.name) already exist in your favorites")
//            return
//        }
//
//        let venue = event._embedded?.venues.first?.name ?? "no venue"
//        let favoriteEvent = FavoriteEvent.init(name: event.name,
//                                               dateTime: event.dates.start.dateTime,
//                                               imageData: imageData,
//                                               id: event.id,
//                                               venue: venue)
//        let savedStatus = EventDataManager.saveToDocumentDirectory(newFavoriteEvent: favoriteEvent)
//        if let error = savedStatus.error {
//            showAlert(title: "Saving error", message: "Error saving \(error.localizedDescription)")
//        } else {
//            showAlert(title: "", message: "\(event.name) saved to favorites")
//        }
    }
}



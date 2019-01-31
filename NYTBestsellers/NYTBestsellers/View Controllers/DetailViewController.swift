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
    
    public var book: Books?
//    public var bookDetailImageView: BookDetailImageView?
// b
//    public var bookD: UIImage?
//
//    public var descriptionFromGoodle: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.view.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        self.view.addSubview(detailView)
        
        
    }
    
    private func configureNavBar() {
        // set navigation bar title
       // navigationItem.title = event.name
        
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



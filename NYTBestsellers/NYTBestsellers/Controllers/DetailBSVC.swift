//
//  DetailNYTBSViewController.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailBSVC: UIViewController {
    let detailDestination = DetailBookView()
    var iexpectABook: ResultsOfBestSellerBooks!
    var coverImageData: Data?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .brown
        setupUI()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(addToFavorites))
        view.addSubview(detailDestination)
    }

    func setupUI(){
    
    }
    @objc private func addToFavorites(){
         let alert = UIAlertController(title: "Saved To Favorties", message: "😁😁😁 Great! You Have Just Saved This Book To Your Favorites.", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Favorites", style: .default, handler: { (done) in
            let destinationVC = UserFavoritesVC()
            self.navigationController?.pushViewController(destinationVC, animated: true)
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .destructive))
        self.present(alert, animated: true)
    }
    

}

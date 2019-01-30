//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    let favoritesView = FavoriteBookView()
    let cellItem = FavoiteBookCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
        self.view.backgroundColor = .red
        view.addSubview(favoritesView)
        favoritesView.collectionViewCellObj.dataSource = self
        favoritesView.collectionViewCellObj.delegate = self
        favoritesBttonPressed()
    }
    func favoritesBttonPressed(){
        view.addSubview(cellItem)
        cellItem.deletebuttonObj.addTarget(self, action: #selector(deletBttnPressed), for: .touchDown)
    }
    @objc func deletBttnPressed(){
        let alert = UIAlertController(title: "OPTIONS", message: "Please Select One Of The Following", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Delete", style: .destructive, handler: { (Success) in
            print("This will Delete an Item from favorites")
        }))
        alert.addAction(UIAlertAction.init(title: "See on Amazon", style: .default, handler: { (Succees) in
            print("This will take you to Amazon")
        }))
       self.present(alert, animated: true)
    }
    
}
extension FavoritesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as? FavoiteBookCell else {return UICollectionViewCell()}
        return cell
    }
}


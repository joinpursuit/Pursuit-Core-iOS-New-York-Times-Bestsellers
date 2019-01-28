//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    let favoritesView = FavoritesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(favoritesView)
        favoritesView.myFavoritesCollectionView.dataSource = self
        favoritesView.myFavoritesCollectionView.delegate = self
    }
}
extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCollectionViewCell", for: indexPath) as? FavoritesCollectionViewCell else { return UICollectionViewCell()}
        cell.delegate = self
        return cell
    }
}
extension FavoritesViewController: FavoritesCollectionViewCellDelegate {
    func actionSheet() {
        let optionMenu = UIAlertController(title: nil, message: "Options:", preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive)
        let editAction = UIAlertAction(title: "See on Amazon", style: .default)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(editAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
}

//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UICollectionViewDataSource {

    
    
    var favoritesView = FavoritesView()
    var favoriteBooks = DataPersistenceModel.getFavoriteBooks()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(favoritesView)
        title = "Favorties (\(favoriteBooks.count))"
        favoritesView.favoritesCollectionView.dataSource = self
        reload()
    }
    
    func reload(){
        favoriteBooks = DataPersistenceModel.getFavoriteBooks()
        favoritesView.favoritesCollectionView.reloadData()
        title = "Favorites (\(favoriteBooks.count))"
    }
    override func viewWillAppear(_ animated: Bool) {
        favoritesView.favoritesCollectionView.reloadData()
        favoriteBooks = DataPersistenceModel.getFavoriteBooks()
        title = "Favorites (\(favoriteBooks.count))"
    }
    @objc func buttonPressed(sender: UIButton){
        let index = sender.tag
        let actionSheet = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        let delete = UIAlertAction(title: "Delete", style: .destructive) { (UIAlertAction) in
            UIView.animate(withDuration: 10.0, delay: 0, options: [.curveEaseIn], animations: {
                self.favoritesView.favoriteCell.favoriteImage.alpha = 0
            }, completion: { (done) in
                DataPersistenceModel.deleteFavoriteBook(atIndex: index)
                self.reload()
            })

        }
        let seeOnAmazon = UIAlertAction(title: "See On Amazon", style: .default) { (UIAlertAction) in
            let amazonURL = self.favoriteBooks[index].amazonURL
            self.openAmazonWebView(url: amazonURL)
        }
        actionSheet.addAction(seeOnAmazon)
        actionSheet.addAction(delete)
        self.present(actionSheet, animated: true, completion: nil)
    }
    func openAmazonWebView(url: URL){
        let amazonVC = AmazonViewController()
        amazonVC.modalPresentationStyle = .overCurrentContext
        amazonVC.amazonURL = url
            self.present(amazonVC, animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCell else {return UICollectionViewCell()}
        let bookToSet = favoriteBooks[indexPath.row]
        cell.favoriteLabel.text = bookToSet.bookName
        cell.favoriteDetailsTextView.text = bookToSet.description
        cell.actionButton.tag = indexPath.row
        cell.actionButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        if let image = UIImage(data: bookToSet.imageData){
            cell.favoriteImage.image = image
        }
        return cell
        
    }

}

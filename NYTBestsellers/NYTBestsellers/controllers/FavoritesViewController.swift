//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//



import UIKit


class FavoriteViewController: UIViewController {
let favoriteView = FavoriteView()
    //let favoriteCell = FavoriteCollectionViewCell()
    private var favoriteBooks = [FavoriteBooks]() {
        didSet {
            self.favoriteView.favoriteCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.addSubview(favoriteView)
        self.favoriteView.favoriteCollectionView.delegate = self
        self.favoriteView.favoriteCollectionView.dataSource = self
//        self.favoriteBooks = BookDataManager.fetchFavoriteBooksFromDocumentsDirectory()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
         self.favoriteBooks = BookDataManager.fetchFavoriteBooksFromDocumentsDirectory()
    }
    
    
}

extension FavoriteViewController: UICollectionViewDelegateFlowLayout {
    
}

extension FavoriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCell", for: indexPath) as? FavoriteCollectionViewCell else {return UICollectionViewCell() }
        let book = favoriteBooks[indexPath.row]
        let imageData = book.imageData
        cell.favoriteCollectionCellImage.image = UIImage(data: imageData)
        cell.favoriteCollectionLabel.text = book.bookName
        cell.favoriteTextView.text = book.description
        cell.delegate = self
        return cell
    }
    
    
}

extension FavoriteViewController: FavoriteCollectionViewCellDelegate {
    func updateCell(favorite: [FavoriteBooks]) {
        self.favoriteBooks = favorite
        
    }
  
  
    func presentAlertController(alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: {
            self.favoriteView.favoriteCollectionView.reloadData()
        })
        //self.favoriteView.favoriteCollectionView.reloadData()
    }
    
   
    
}

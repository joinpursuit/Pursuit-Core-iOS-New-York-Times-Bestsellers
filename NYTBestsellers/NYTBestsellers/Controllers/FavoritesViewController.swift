//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
  let favoritesView = FavoritesView()
  var books = BookModel.getBook() {
    didSet{
      DispatchQueue.main.async {
        self.favoritesView.colloectionView.reloadData()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    favoritesView.colloectionView.dataSource = self
    favoritesView.colloectionView.register(FavoritesCell.self, forCellWithReuseIdentifier: "Favorites")
    
    view.addSubview(favoritesView)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    books = BookModel.getBook()
  }
  @objc private func deleteFavoriteBook(sender: UIButton){
    let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { alert in
      let i : Int = (sender.layer.value(forKey: "index")) as! Int
      BookModel.delete(atIndex: i)
      self.books = BookModel.getBook()         }
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    alertController.addAction(deleteAction)
    alertController.addAction(cancelAction)
    present(alertController, animated: true)
  }
  
  
  
}
extension FavoritesViewController: UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return books.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Favorites", for: indexPath) as? FavoritesCell else { return UICollectionViewCell() }
    let book = books[indexPath.row]
    cell.layer.cornerRadius = 20.0
    
    cell.label.text = book.author
    cell.image.image = UIImage(data: book.imageData)
    cell.textView.text = book.description
    cell.button.layer.setValue(indexPath.row, forKey: "index")
    
    cell.button.addTarget(self, action: #selector(deleteFavoriteBook), for: .touchUpInside)
    return cell
  }
  
}



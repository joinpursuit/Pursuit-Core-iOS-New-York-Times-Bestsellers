//
//  FavoriteViewController.swift
//  NYTBestsellers
//
//  Created by Biron Su on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    let favoriteView = FavoriteView()

    var books = [FavoriteBook]() {
        didSet{
            DispatchQueue.main.async {
                self.favoriteView.collectionView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(favoriteView)
        navigationItem.title = "Favorites"
        favoriteView.collectionView.dataSource = self
        getFavoriteBook()
    }
    override func viewWillAppear(_ animated: Bool) {
        getFavoriteBook()
    }
    func getFavoriteBook() {
        books = FavoriteBookModel.getBooks()
    }
    @objc func menuAlert(sender: UIButton) {
        let optionMenu = UIAlertController(title: nil, message: "nil", preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler:
        {
            (alert: UIAlertAction!) -> Void in
            FavoriteBookModel.deleteFavoriteBook(index: sender.tag)
            self.getFavoriteBook()
        })
        
        let amazonAction = UIAlertAction(title: "See on Amazon", style: .default, handler:
        {
            (alert: UIAlertAction!) -> Void in
            // add amazon button
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:
        {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(amazonAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
}
extension FavoriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCollectionViewCell else {return UICollectionViewCell()}
        let cellToSet = books[indexPath.row]
        cell.menuButton.tag = indexPath.row
        cell.menuButton.addTarget(self, action: #selector(menuAlert), for: .touchUpInside)
        cell.bookText.text = cellToSet.description
        cell.bookLabel.text = "\(cellToSet.weeks_on_list) weeks on best sellers"
        GoogleAPIClient.getImage(keyword: cellToSet.primary_isbn13) { (error, image) in
            if let _ = error {
                DispatchQueue.main.async {
                    cell.bookImage.image = UIImage(named: "book")
                }
            } else if let data = image {
                ImageHelper.fetchImageFromNetwork(urlString: data[0].volumeInfo.imageLinks.smallThumbnail.absoluteString, completion: { (error, smallImage) in
                    if let error = error {
                        print("Small Image error \(error)")
                    } else if let smallImage = smallImage {
                        DispatchQueue.main.async {
                            cell.bookImage.image = smallImage
                            cell.bookText.text = data[0].volumeInfo.description
                        }
                    }
                })
            }
        }
        return cell
    }
}

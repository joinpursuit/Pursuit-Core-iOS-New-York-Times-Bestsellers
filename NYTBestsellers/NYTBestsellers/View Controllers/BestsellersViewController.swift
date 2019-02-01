//
//  BestsellersViewController.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestsellersViewController: UIViewController {
    
    public var googleDescription = String()
    
    let bestsellersView = BestsellersView()
    private var bookGenres = [BestsellerGenre]() {
        didSet {
            DispatchQueue.main.async {
                self.bestsellersView.bestsellersPickerView.reloadAllComponents()
            }
        }
    }
    private var books = [Books]() {
        didSet {
            DispatchQueue.main.async {
                self.bestsellersView.bestsellerCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view.addSubview(bestsellersView)
        // dump(bookGenres)
        //dump(books)
        loadGenres()
        loadBooks(genre:  "Manga")
        bestsellersView.bestsellerCollectionView.dataSource = self
        bestsellersView.bestsellerCollectionView.delegate = self
        bestsellersView.bestsellersPickerView.delegate = self
        bestsellersView.bestsellersPickerView.dataSource = self
        
        
    }
    
    
    //todo: func for catagories then call in viewDidLoad
    // func for NYT Bestsellers then call in viewDidLoad
    func loadGenres() {
        APIClient.getGenres { (appError, data) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let data = data {
                self.bookGenres = data
            }
        }
    }
    
    func loadBooks(genre: String) {
        APIClient.getBooks(genre: genre ) { (appError, data ) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let data = data {
                self.books = data
                dump(self.books)
            }
        }
        
    }
    
}
extension BestsellersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = bestsellersView.bestsellerCollectionView.dequeueReusableCell(withReuseIdentifier: "BestsellersCell", for: indexPath) as? BestsellersCollectionCell else { return UICollectionViewCell() }
        
        let currentBook = books[indexPath.row]
        
        cell.weeksLabel.text = " \(currentBook.weeksOnList) week(s) on best seller list"
        cell.bestsellersDescriptionTextView.text = currentBook.bookDetails[0].description
        
        
        let isbn = currentBook.bookDetails[0].primaryIsbn13
        
        APIClient.getGoogleData(isbn: isbn) { (appError, googleData) in
            if let appError = appError {
                print(appError)
                }
            if let data = googleData {
                dump("this is google data \(data)")
            let imageToSet = data[0].volumeInfo.imageLinks.thumbnail
//                self.googleDescription = data[0].volumeInfo.description
                DispatchQueue.main.async {
                    if let image = ImageHelper.fetchImageFromCache(urlString: imageToSet) {
                        DispatchQueue.main.async {
                            cell.bookImageView.image = image
                        }
                    } else {
                        ImageHelper.fetchImageFromNetwork(urlString: imageToSet, completion: { (appError, imageXXX) in
                            if let appError = appError {
                                print(appError.errorMessage())
                                DispatchQueue.main.async {
                                    cell.bookImageView.image = UIImage.init(named: "bookPlaceHolder")

                                }
                            }
                            if let imageYYY = imageXXX  {
                                cell.bookImageView.image = imageYYY
                            }
                        })
                    }
                }
            }
        }
        //TODO get google api working and loading data
        
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let bookToSegue = books[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.book = bookToSegue
        
        
        
        navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
    
    
}
extension BestsellersViewController: UICollectionViewDelegate {
    
}

extension BestsellersViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bookGenres.count
    }
    
    
}
extension BestsellersViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bookGenres[row].listName
        
    }
}


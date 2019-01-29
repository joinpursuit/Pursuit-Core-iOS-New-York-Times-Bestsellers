//
//  NYTBestsellersViewController.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTBestsellersViewController: UIViewController {
    
    var category = "Hardcover Nonfiction" {
        didSet {
            getBooks()
        }
    }
    
    private var categoriesOfBooks = [BookCategories]() {
        didSet {
            DispatchQueue.main.async {
                self.bestsellerView.bestSellerPickerView.reloadAllComponents()
            }
        }
    }
    
    private var booksInCategory = [BookData]() {
        didSet {
            DispatchQueue.main.async {
                self.bestsellerView.bestSellerCollectionView.reloadData()
            }
        }
    }
    
    
    let bestsellerView = BestsellersView()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = BestsellersView()
     
        self.view.backgroundColor = .red
        self.view.addSubview(bestsellerView)
        bestsellerView.bestSellerCollectionView.dataSource = self
        bestsellerView.bestSellerCollectionView.delegate = self
        bestsellerView.bestSellerPickerView.dataSource = self
        bestsellerView.bestSellerPickerView.delegate = self
        getBookCategories()
        getBooks()
    }
    
    
    func getBookCategories(){
        NYTBestsellers.fetchBooks { (error, books) in
            if let appError = error {
                print(appError)
            }
            if let books = books {
                self.categoriesOfBooks = books
            }
        }
    }
    
    func getBooks(){
        NYTBestsellers.fetchBookDetails(category: category) { (error, book) in
            if let appError = error {
                print("Error: \(appError)")
            } else if let book = book {
                self.booksInCategory = book.results
            }
        }
    }

    
}

extension NYTBestsellersViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksInCategory.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestsellersCell", for: indexPath) as? BestsellersCollectionViewCell else { return UICollectionViewCell() }
        let book = booksInCategory[indexPath.row]
        cell.NumberOfWeeksLabel.text = "\(String(describing: book.weeks_on_list)) on best sellers list"
        cell.TextViewDescription.text = book.book_details.first?.description
        
        if let bookISNBs = book.isbns.first?.isbn13 {
            NYTBestsellers.getCoverImages(isbn: bookISNBs) { (error, data) in
                if let error = error {
                    print("Error: \(error)")
                } else if let imageData = data {
                    ImageHelper.fetchImageFromNetwork(urlString: imageData.smallThumbnail, completion: { (error, image) in
                        if let error = error {
                            print("Error: \(error)")
                        } else if let imageData = image {
                            cell.BestsellerImageView.image = imageData
                        }
                    })
                }
            }
        }
        

        
        
        return cell
    }

}
extension NYTBestsellersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
extension NYTBestsellersViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoriesOfBooks.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoriesOfBooks[row].categoryName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        category = categoriesOfBooks[row].categoryName
    }
    
    
}

//
//  MainViewController.swift
//  NYTBestsellers
//
//  Created by Donkemezuo Raymond Tariladou on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    let baseView = BaseView()
    var selectedBookCategory = "Travel" {
        didSet {
            getBooks()
        }
    }
    
    var bookCategories = [BookCategories]() {
        didSet{
            DispatchQueue.main.async {
                self.baseView.pickerView.reloadAllComponents()
            }
        }
    }
    var booksInCategory = [BookDetailsAndCredentials](){
        didSet{
            DispatchQueue.main.async {
                self.baseView.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.view.addSubview(baseView)
        baseView.pickerView.dataSource = self
        baseView.pickerView.delegate = self
        baseView.collectionView.delegate = self
        baseView.collectionView.dataSource = self
        getCategoriesData()
        getBooks()
    }
    
    func getCategoriesData(){
        bookCategories = CategoryDataManager.fetchCategoriesFromDocumentsDirectory()
    }
    
    
    func getBooks(){
        BookAPIClient.BookDetail(categoryName: selectedBookCategory) { (error, book) in
            if let error = error {
                print("Error: \(error)")
            } else if let book = book {
                self.booksInCategory = book.results
                
            }
        }
    }
    

}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksInCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell", for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
        let book = booksInCategory[indexPath.row]
        
        cell.label.text = "\(book.weeks_on_list) weeks on best sellers list"
        
        if let description = book.book_details.first?.description {
            cell.TextView.text = description
        }
        
        if let bookISBN = book.isbns.first?.isbn13{
            
    BookAPIClient.BookCoverImage(Isbn:bookISBN) { (error, imageData) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = imageData {
                ImageHelper.fetchImageFromNetwork(urlString: data.imageLinks.smallThumbnail, completion: { (error, UIImage) in
                    if let error = error {
                        print("Error: \(error)")
                    } else if let data = UIImage {
                        cell.imageView.image = data
                    }
                })
            }
        }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let book = booksInCategory[indexPath.row]
        let detailedVC = DetailViewController(book:book)
        if let details = book.book_details.first?.author {
            detailedVC.detailView.label.text = details
        }
        if let description = book.book_details.first?.description {
            detailedVC.detailView.textView.text = description
        }
        
    self.navigationController?.pushViewController(detailedVC, animated: true)
    }

}

extension MainViewController: UIPickerViewDataSource,UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bookCategories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bookCategories[row].list_name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedBookCategory = bookCategories[row].list_name
    }
    
    
}

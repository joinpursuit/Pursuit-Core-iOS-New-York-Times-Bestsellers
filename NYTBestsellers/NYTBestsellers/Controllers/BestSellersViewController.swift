//
//  BestSellersViewController.swift
//  NYTBestsellers
//
//  Created by Kevin Waring on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersViewController: UIViewController {
    
    var books = [Book]() {
        didSet {
            DispatchQueue.main.async {
                self.bestSellerView.myCollectionView.reloadData()
            }
        }
    }
    var listNames = [Genre](){
        didSet {
            DispatchQueue.main.async {
                self.bestSellerView.myPicker.reloadAllComponents()
            }
            
        }
    }
   
let bestSellerView = BestSellersView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bestSellerView)
        navigationItem.title = "Best Sellers"
        view.backgroundColor = .red
        bestSellerView.myCollectionView.delegate = self
        bestSellerView.myCollectionView.dataSource = self
        bestSellerView.myPicker.dataSource = self
        bestSellerView.myPicker.delegate = self
//        if let row = UserDefaults.standard.object(forKey: "DefaultInt") as? Int {
//            bestSellerView.myPicker.selectRow(row, inComponent: 0, animated: true)
//        }
        APIClient.getListName { (apperror, listNames) in
            if let apperror = apperror {
                print(apperror)
            }
            if let listNames = listNames {
                self.listNames = listNames
            }
        }
    }
    
    //user defaults
    override func viewWillAppear(_ animated: Bool) {
        if let defaultGenre = UserDefaults.standard.object(forKey: "DefaultGenre") as? String {
            APIClient.getBooks(listName: defaultGenre.replacingOccurrences(of: " ", with: "-")) { (appError, books) in
                if let appError = appError {
                    print(appError)
                }
                if let books = books {
                    self.books = books
                }
            }
        }
        if let defaultInt = UserDefaults.standard.object(forKey: "DefaultInt") as? String {
            self.bestSellerView.myPicker.selectRow(Int(defaultInt)!, inComponent: 0, animated: true)
                
        }
//        if let row = UserDefaults.standard.object(forKey: "DefaultInt") as? Int {
//            bestSellerView.myPicker.selectRow(row, inComponent: 0, animated: true)
//        }
    }

}
extension BestSellersViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellerCell", for: indexPath) as? BSCollectionViewCell else {return UICollectionViewCell()}
        let bookToSet = books[indexPath.row]
        cell.bookLabel.text = "\(bookToSet.weeks_on_list.description) Weeks on Best Seller List"
        cell.bookText.text = bookToSet.book_details.first?.description
        APIClient.getGoogleData(isbn: (bookToSet.book_details.first?.primary_isbn10)!) { (appError, data) in
            if let appError = appError {
                print(appError)
            }
            if let data = data {
                ImageHelper.fetchImageFromNetwork(urlString: (data[0].volumeInfo.imageLinks.smallThumbnail.absoluteString), completion: { (appError, image) in
                    if let appError = appError {
                        print(appError)
                    }
                    if let image = image {
                        cell.bookImage.image = image
                    }
                })
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = DetailViewController.init(isbn: books[indexPath.row].book_details[0].primary_isbn10, author: books[indexPath.row].book_details[0].author,bookName: books[indexPath.row].book_details[0].title, description: books[indexPath.row].book_details[0].description)
        navigationController?.pushViewController(detail, animated: true)
    }
    
}
extension BestSellersViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listNames[row].list_name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let chosenCatergory = listNames[row].list_name
        APIClient.getBooks(listName: chosenCatergory) { (appError, books) in
            if let appError = appError {
                print(appError)
            }
             if let books = books {
                self.books = books
            }
        }
    }
    
}

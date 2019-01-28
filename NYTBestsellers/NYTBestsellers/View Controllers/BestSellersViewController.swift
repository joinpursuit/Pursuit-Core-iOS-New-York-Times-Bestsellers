//
//  BestSellersViewController.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersViewController: UIViewController {
    
    private let bestSellerView = BestSellersView()
    private var bestSellerCategories = [CategoryResults](){
        didSet { //use case ex. when searching
            //tableview reload data needs to be on the main thread
            DispatchQueue.main.async {
                self.bestSellerView.myBestSellerPickerView.reloadAllComponents()
            }
        }
    }
    private var bestSellerBooks = [BookResults](){
        didSet { //use case ex. when searching
            //tableview reload data needs to be on the main thread
            DispatchQueue.main.async {
                self.bestSellerView.myBestSellerCollectionView.reloadData()
            }
        }
    }
    var listName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bestSellerView)
        setupPicker()
        setupBooks(listName: "combined-print-and-e-book-fiction")
        bestSellerView.myBestSellerCollectionView.dataSource = self
        bestSellerView.myBestSellerCollectionView.delegate = self
        bestSellerView.myBestSellerPickerView.dataSource = self
        bestSellerView.myBestSellerPickerView.delegate = self

    }
    private func setupPicker(){
        NYTBookAPI.getBookCategories { (appError, categories) in
            if let appError = appError {
                print("book categories error: \(appError)")
            } else if let categories = categories {
                self.bestSellerCategories = categories
            }
        }
    }
    private func setupBooks(listName: String) {
        NYTBookAPI.bookResults(listName: listName) { (appError, books) in
            if let appError = appError {
                print("book categories error: \(appError)")
            } else if let books = books {
                self.bestSellerBooks = books
            }
        }
    }
}
extension BestSellersViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestSellerBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestCollectionViewCell", for: indexPath) as? BestCollectionViewCell else { return UICollectionViewCell()}
        let book = bestSellerBooks[indexPath.row]
        cell.cellLabel.text = "\(book.weeksOnList) weeks on Best Sellers"
        cell.cellTextView.text = book.bookDetails.first?.bookDescription
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let book = bestSellerBooks[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.detailView.detailLabel.text = book.listName
        //let book = books[index.row]
        //detailVC.book = book
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
extension BestSellersViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bestSellerCategories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        listName = bestSellerCategories[row].listNameEncoded
        return bestSellerCategories[row].displayName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let categoryName = bestSellerCategories[row].listNameEncoded
        //CHECK IF OK!
        setupBooks(listName: categoryName)
    }
}

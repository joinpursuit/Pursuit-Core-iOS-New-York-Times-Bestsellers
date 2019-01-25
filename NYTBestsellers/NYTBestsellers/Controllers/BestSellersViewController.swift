//
//  BestSellersViewController.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersViewController: UIViewController {
    
    private let bestSellersView = BestSellersView()
    private var currentBookCategory = "Animals" {
        didSet {
            searchForBooks()
        }
    }
    private var bookCategoryPickerView = [BookCategories]() {
        didSet {
            DispatchQueue.main.async {
                self.bestSellersView.pickerView.reloadAllComponents()
            }
        }
    }
    private var bookListData = [BookList]() {
        didSet {
            DispatchQueue.main.async {
                self.bestSellersView.collectionView.reloadData()
            }
        }
    }

    fileprivate func searchForBooks() {
        NYTAPIClient.searchForBooks(in: currentBookCategory) { (appError, bookList) in
            if let appError = appError {
                print("error in getting book list - \(appError)")
            } else if let bookList = bookList {
                self.bookListData = bookList
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(bestSellersView)
        NYTAPIClient.getBookList { (appError, categories) in
            if let appError = appError {
                print("error in getting book categories - \(appError)")
            } else if let categories = categories {
                self.bookCategoryPickerView = categories
            }
        }
        searchForBooks()
        bestSellersView.collectionView.dataSource = self
        bestSellersView.pickerView.dataSource = self
        bestSellersView.pickerView.delegate = self
    }
    

}

extension BestSellersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = bestSellersView.collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as? BookCollectionViewCell else { return UICollectionViewCell() }
        let book = bookListData[indexPath.row]
        cell.bookDescriptionTextView.text = book.book_details.first?.bookDescription
        cell.numberOfWeeksOnList.text = "\(book.weeks_on_list.description) week on Best Seller"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookListData.count
    }
}

extension BestSellersViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bookCategoryPickerView[row].list_name
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bookCategoryPickerView.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentBookCategory = bookCategoryPickerView[row].list_name_encoded
    }
}

//
//  BestSellersViewController.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

protocol BestSellersViewControllerDelegate: AnyObject {
    func sendOverBook(bookToSet: NYTBook)
}

class BestSellersViewController: UIViewController {
    weak var delegate: BestSellersViewControllerDelegate?
    private var detailBookDescription = ""
    private let bestSellersView = BestSellersView()
    private var currentBookCategory = "Animals" {
        didSet {
            searchForBooks()
        }
    }
    private var bookCategoryPickerViewData = [BookCategories]() {
        didSet {
            DispatchQueue.main.async {
                self.bestSellersView.pickerView.reloadAllComponents()
            }
        }
    }
    private var books = [NYTBook]() {
        didSet {
            DispatchQueue.main.async {
                self.bestSellersView.collectionView.reloadData()
            }
        }
    }

    fileprivate func searchForBooks() {
        NYTAPIClient.searchForBooks(in: currentBookCategory) { (appError, books) in
            if let appError = appError {
                print("error in getting book list - \(appError)")
            } else if let books = books {
                self.books = books
            }
        }
    }
    
    fileprivate func getBookCategories() {
        if SavedBookCategories.bookCategories.isEmpty {
            NYTAPIClient.getBookList { (appError, categories) in
                if let appError = appError {
                    print("error in getting book categories - \(appError)")
                } else if let categories = categories {
                    self.bookCategoryPickerViewData = categories
                    SavedBookCategories.bookCategories = categories
                }
            }
        } else {
            bookCategoryPickerViewData = SavedBookCategories.bookCategories
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(bestSellersView)
        getBookCategories()
        searchForBooks()
        bestSellersView.collectionView.dataSource = self
        bestSellersView.collectionView.delegate = self
        bestSellersView.pickerView.dataSource = self
        bestSellersView.pickerView.delegate = self
        checkForUserDefaultsSetting()
    }
    
    private func checkForUserDefaultsSetting() {
        if let rowNumber = UserDefaults.standard.object(forKey: "Book Category Index Number") as? Int {
            bestSellersView.pickerView.selectRow(rowNumber, inComponent: 0, animated: true)
        } else {
            bestSellersView.pickerView.selectRow(Int.random(in: 0..<bookCategoryPickerViewData.count), inComponent: 0, animated: true)
        }
    }
}

extension BestSellersViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = bestSellersView.collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as? BookCollectionViewCell else { return UICollectionViewCell() }
        let book = books[indexPath.row]
        cell.bookDescriptionLabel.text = book.book_details.first?.bookShortDescription
        cell.numberOfWeeksOnList.text = "\(book.weeks_on_list.description) week on Best Seller"
        if let bookDetailsExists = book.book_details.first {
            GoogleBooksAPIClient.getGoogleBookImageUrl(bookISBN: bookDetailsExists.primaryISBN13) { (appError, bookData) in
            if let appError = appError {
                print("GoogleBooksAPIClient - \(appError)")
            } else if let bookData = bookData {
                self.books[indexPath.row].bookLongDescription = bookData.bookLongDescription
                if let image = ImageHelper.fetchImageFromCache(urlString: bookData.imageLinks.thumbnail) {
                    DispatchQueue.main.async {
                        cell.bookImage.image = image
                    }
                    self.books[indexPath.row].bookGoogleImage = image.jpegData(compressionQuality: 1)
                } else {
                    ImageHelper.fetchImageFromNetwork(urlString: bookData.imageLinks.thumbnail, completion: { (appError, image) in
                    if let appError = appError {
                        print("fetchImageNetwork - \(appError)")
                    } else if let image = image {
                        cell.bookImage.image = image
                    }
                })
                }
            }
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let bookDetail = BookDetailViewController()
        self.delegate = bookDetail
        self.delegate?.sendOverBook(bookToSet: books[indexPath.row])
        navigationController?.pushViewController(bookDetail, animated: true)
    }
    
}

extension BestSellersViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bookCategoryPickerViewData[row].list_name
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bookCategoryPickerViewData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentBookCategory = bookCategoryPickerViewData[row].list_name_encoded
    }
}

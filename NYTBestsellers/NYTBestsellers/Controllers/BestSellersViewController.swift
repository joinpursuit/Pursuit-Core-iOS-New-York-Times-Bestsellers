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
    private var currentBookCategoryToSearch = "picture-books" {
        didSet {
            saveGoogleDescription.removeAll()
            saveGoogleImage.removeAll()
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
    
    private var saveGoogleDescription: [Int:String] = [:]
    private var saveGoogleImage: [Int:Data] = [:]
    
    fileprivate func searchForBooks() {
        NYTAPIClient.searchForBooks(in: currentBookCategoryToSearch) { (appError, books) in
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
                    self.checkForUserDefaultsSetting()

                }
            }
        } else {
            bookCategoryPickerViewData = SavedBookCategories.bookCategories
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(bestSellersView)
        navigationItem.title = "Best Sellers"
        bestSellersView.collectionView.dataSource = self
        bestSellersView.collectionView.delegate = self
        bestSellersView.pickerView.dataSource = self
        bestSellersView.pickerView.delegate = self
        getBookCategories()
    }
    
    private func checkForUserDefaultsSetting() {
        if let rowNumber = UserDefaults.standard.object(forKey: UserDefaultKeys.categoryRowNumber) as? Int, let currentCategory = UserDefaults.standard.object(forKey: UserDefaultKeys.categoryName) as? String {
            currentBookCategoryToSearch = currentCategory
            DispatchQueue.main.async {
                self.bestSellersView.pickerView.selectRow(rowNumber, inComponent: 0, animated: true)

            }
        } else {
           // bestSellersView.pickerView.selectRow(0, inComponent: 0, animated: true)
            currentBookCategoryToSearch = bookCategoryPickerViewData[0].list_name_encoded
        }
        searchForBooks()
    }
}

extension BestSellersViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = bestSellersView.collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as? BookCollectionViewCell else { return UICollectionViewCell() }
        let book = books[indexPath.row]
        cell.configureCell(book: book)
        configureBookCoverFromGoogle(cell: cell, atIndexPath: indexPath, book: book)
        return cell
    }
    
    private func configureBookCoverFromGoogle(cell: BookCollectionViewCell, atIndexPath indexPath: IndexPath, book: NYTBook) {
        cell.bookImage.image = UIImage(named: "placeHolder")
        if let bookDetailsExists = book.book_details.first {
            GoogleBooksAPIClient.getGoogleBookImageUrl(bookISBN: bookDetailsExists.primaryISBN13) { (appError, bookData) in
                if let appError = appError {
                    print("GoogleBooksAPIClient - probably reached daily limits - \(appError)")
                    cell.bookImage.image = UIImage(named: "placeHolder")
                } else if let bookData = bookData {
                    self.saveGoogleDescription[indexPath.row] = bookData.bookLongDescription
                    if let image = ImageHelper.fetchImageFromCache(urlString: bookData.imageLinks.thumbnail) {
                        DispatchQueue.main.async {
                            cell.bookImage.image = image
                            if let imageCanBeSaved = image.jpegData(compressionQuality: 1.0) {
                                self.saveGoogleImage[indexPath.row] = imageCanBeSaved
                            }
                        }
                     } else {
                        ImageHelper.fetchImageFromNetwork(urlString: bookData.imageLinks.thumbnail, completion: { (appError, image) in
                            if let appError = appError {
                                print("fetchImageNetwork - \(appError)")
                               // cell.bookImage.image = UIImage(named: "placeHolder")
                                self.saveGoogleImage[indexPath.row] = UIImage(named: "placeHolder")!.jpegData(compressionQuality: 1.0)
                            } else if let image = image {
                                cell.bookImage.image = image
                                if let imageCanBeSaved = image.jpegData(compressionQuality: 1.0) {
                                    self.saveGoogleImage[indexPath.row] = imageCanBeSaved
                                }
                            }
                        })
                    }
                }
            }
        } else {
            print("no book detail available")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let book = books[indexPath.row]
        let bookToSave = SavedBook.init(title: book.book_details[0].title, author: book.book_details[0].author, shortDescription: book.book_details[0].bookShortDescription, longDescription: saveGoogleDescription[indexPath.row] ?? "", bookImage: saveGoogleImage[indexPath.row] ?? nil, amazonLink: book.amazon_product_url, isbn13: book.book_details[0].primaryISBN13, addedDate: nil)
        let bookDetail = BookDetailViewController(book: bookToSave)
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
        currentBookCategoryToSearch = bookCategoryPickerViewData[row].list_name_encoded
    }
}

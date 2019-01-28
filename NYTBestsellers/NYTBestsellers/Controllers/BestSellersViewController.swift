//
//  BestSellersViewController.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

protocol BestSellersViewControllerDelegate: AnyObject {
    func sendOverBook(bookToSet: NYTBook, detailBookDescription: String)
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
    private var bookCategoryPickerView = [BookCategories]() {
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
        bestSellersView.collectionView.delegate = self
        bestSellersView.pickerView.dataSource = self
        bestSellersView.pickerView.delegate = self
    }
}

extension BestSellersViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = bestSellersView.collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as? BookCollectionViewCell else { return UICollectionViewCell() }
        let book = books[indexPath.row]
        cell.bookDescriptionLabel.text = book.book_details.first?.bookDescription
        cell.numberOfWeeksOnList.text = "\(book.weeks_on_list.description) week on Best Seller"
        if let bookDetailsExists = book.book_details.first {
            GoogleBooksAPIClient.getGoogleBookImageUrl(bookISBN: bookDetailsExists.primaryISBN13) { (appError, imageURL) in
            if let appError = appError {
                print("GoogleBooksAPIClient - \(appError)")
            } else if let imageURL = imageURL {
                if let image = ImageHelper.fetchImageFromCache(urlString: imageURL) {
                    DispatchQueue.main.async {
                        cell.bookImage.image = image
                    }
                } else {
                    ImageHelper.fetchImageFromNetwork(urlString: imageURL, completion: { (appError, image) in
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
        let bookToSet = books[indexPath.row]
        let bookDetail = BookDetailViewController()
        self.delegate = bookDetail
        self.delegate?.sendOverBook(bookToSet: bookToSet, detailBookDescription: detailBookDescription)
       navigationController?.pushViewController(bookDetail, animated: true)
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

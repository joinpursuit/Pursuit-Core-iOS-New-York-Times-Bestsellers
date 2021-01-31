//
//  NYTBestSellingController.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

private struct GoogleBookInfo {
    let image: UIImage?
    let isbn: String
    let description: String
}

class NYTBestSellingController: UIViewController {
    
    private var allGoogleBookInfo = [GoogleBookInfo]()
    
    let nYTBestSellingView = NYTBestSellingView()
    
    var defaultCategoryName = "manga"
    var allBookCategories = [Category]() {
        didSet {
            let rowNum = allBookCategories.firstIndex { (category) -> Bool in
                return category.listNameEncoded == defaultCategoryName
            }
            DispatchQueue.main.async {
                self.nYTBestSellingView.categoryPickerView.reloadAllComponents()
                self.nYTBestSellingView.categoryPickerView.selectRow(rowNum ?? 0, inComponent: 0, animated: false)
            }
        }
    }
    
    var nYTBestSellers = [NYTBook]() {
        didSet {
            DispatchQueue.main.async {
                self.nYTBestSellingView.bestsellersCollectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(nYTBestSellingView)
        nYTBestSellingView.delegate = self
        initialSetup()
    }
    
    private func initialSetup() {
        getAllCategories()
        checkUserDefaultsAndFetchBestSellers()
    }
    
    private func checkUserDefaultsAndFetchBestSellers() {
        if let defaultCategoryName = UserDefaults.standard.object(forKey: UserDefaultsKeys.defaultCategory) as? String {
            searchNYTBestSellersByCategory(category: defaultCategoryName)
            self.defaultCategoryName = defaultCategoryName
        } else {
            searchNYTBestSellersByCategory(category: self.defaultCategoryName)
        }
    }
    
    private func getAllCategories() {
        NYTBestsellingCategoriesAPIClient.getAllCategories { (appError, categories) in
            if let appError = appError {
                print(appError.errorMessage())
                self.showAlert(title: "\(appError)", message: "\(appError.errorMessage())")
            } else if let categories = categories {
                self.allBookCategories = categories.sorted { $0.displayName < $1.displayName }
            }
        }
    }
    
    private func searchNYTBestSellersByCategory(category: String) {
        NYTBestsellingBooksAPIClient.getAllBooks(category: category) { (appError, nYTBooks) in
            if let appError = appError {
                print(appError.errorMessage())
                self.showAlert(title: "\(appError)", message: "\(appError.errorMessage())")
            } else if let nYTBooks = nYTBooks {
                self.nYTBestSellers = nYTBooks
            }
        }
    }
    
}

extension NYTBestSellingController: NYTBestSellingViewDelegate {
    
    // CollectionView
    func cellPressedToSegue(indexPath: IndexPath) {
        let currentBook = nYTBestSellers[indexPath.row]
        var googleBookInfo: GoogleBookInfo?
        let index = allGoogleBookInfo.firstIndex {$0.isbn == currentBook.bookDetails[0].primaryIsbn13}
        if let index = index {
            googleBookInfo = allGoogleBookInfo[index]
        }
        let destinationVC = NYTDetailBestSellingController(book: currentBook, bookImage: googleBookInfo?.image, bookDescription: googleBookInfo?.description)
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func numberOfNYTBooks() -> Int {
        return nYTBestSellers.count
    }
    
    func numberOfCategories() -> Int {
        return allBookCategories.count
    }
    
    func configureUICollectionCell(indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = nYTBestSellingView.bestsellersCollectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as? BookCell else { return UICollectionViewCell() }
        let currentBook = nYTBestSellers[indexPath.row]
        let bookIsbn13 = currentBook.bookDetails.first!.primaryIsbn13
        cell.configureCell(nYTBook: currentBook)
        configureCellImage(cell: cell, bookIsbn: bookIsbn13)
        return cell
    }
    
    private func configureCellImage(cell: BookCell, bookIsbn: String) {
        var googleBookDescription = ""
        var bookImageUrlString = "" {
            didSet {
                ImageHelper.fetchImageFromNetwork(urlString: bookImageUrlString) { (appError, bookImage) in
                    if let appError = appError {
                        print(appError.errorMessage())
                    } else if let bookImage = bookImage {
                        cell.bookImageView.image = bookImage
                        let bookImageInfo = GoogleBookInfo.init(image: bookImage, isbn: bookIsbn, description: googleBookDescription)
                        self.allGoogleBookInfo.append(bookImageInfo)
                    }
                }
            }
        }
        
        GoogleBookSearchAPIClient.getGoogleBooksFromISBN(isbn: bookIsbn) { (appError, googleBook) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let googleBook = googleBook {
                let imageUrl = googleBook.volumeInfo.imageLinks.thumbnail
                googleBookDescription = googleBook.volumeInfo.description
                bookImageUrlString = imageUrl.absoluteString
            }
        }
    }
    
    
    // PickerView
    func setTitleOfPickerView(rowNum: Int) -> String {
        let currentCategory = allBookCategories[rowNum]
        return currentCategory.displayName
    }
    
    func categorySelected(row: Int, component: Int) {
        let categoryName = allBookCategories[row].listNameEncoded
        searchNYTBestSellersByCategory(category: categoryName)
        allGoogleBookInfo = [GoogleBookInfo]()
    }
}

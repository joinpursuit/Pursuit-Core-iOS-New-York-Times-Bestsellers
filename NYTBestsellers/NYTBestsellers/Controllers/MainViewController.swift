//
//  MainViewController.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    let mainView = MainView()
    
    var category = "Hardcover Nonfiction"
    {
        didSet {
            getBooks()
        }
    }
    
    var bookCategories = [Books](){
        didSet {
            DispatchQueue.main.async {
                self.mainView.bestSellerPickerView.reloadAllComponents()
            }
        }
    }
    
   var googleInfo = [BookInfo](){
        didSet {
            DispatchQueue.main.async {
                self.mainView.myCollectionView.reloadData()
            }
        }
    }
    
    var bookDetails = [BookData](){
        didSet {
            DispatchQueue.main.async {
             self.mainView.myCollectionView.reloadData()
//                dump(self.bookDetails)
            }
        }
    }
    
    func getBooks() {
        NYTAPIClient.getBook { (appError, book) in
            DispatchQueue.main.async {
                
            
            if let appError = appError {
                print(appError.errorMessage())
            }
            if let data = book {
                self.bookCategories = data
                self.mainView.myCollectionView.reloadData()
            }
            }
        }
    }
  
    func getDetailedInfo() {
        DetailsAPIClient.getDetails { (appError, book) in
            if let appError = appError {
                print(appError.errorMessage())
            }
            if let data = book {
                DispatchQueue.main.async {
                self.bookDetails = data
                dump(self.bookDetails)
                }
            }
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(mainView)
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        getBooks()
        getDetailedInfo()
        mainView.myCollectionView.dataSource = self
        mainView.myCollectionView.delegate = self
        mainView.bestSellerPickerView.dataSource = self
        mainView.bestSellerPickerView.delegate = self
     
    }
}
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BooksCollectionViewCell", for: indexPath) as? BooksCollectionViewCell else { return UICollectionViewCell() }
        let bookInfo = bookDetails[indexPath.row]
    cell.WeeksLabel.text = "\(bookInfo.weeksOnList) weeks on best seller list"
    cell.TextViewDescription.text = bookInfo.bookDetails.first?.description

        if let bookISNBs = bookInfo.isbns.first?.isbn13 {
            GoogleAPIClient.getDetails(isbn: bookISNBs) { (appError, bookInfo) in
                
            
            if let bookInfo = bookInfo {
                cell.googleBookInfo = bookInfo[0]
                ImageHelper.fetchImageFromNetwork(urlString: bookInfo[0].volumeInfo.imageLinks.smallThumbnail, completion: { (appError, image) in
                      cell.BestsellerImageView.image = nil 
                    if let appError = appError {
                        print(appError)
                    } else if let image = image {
                        cell.BestsellerImageView.image = image
        
                    }
                })
        
            } else if let appError = appError {
                print(appError)
            }
            
            }
        }
        
        
        
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookDetails.count
        //return bookDetails[section].bookDetails[section].title.count
    }
    
    
}
extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bookCategories.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bookCategories[row].listName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.category = bookCategories[row].listName
    }

}
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? BooksCollectionViewCell {
             let detailViewController = DetailViewController()
            if let image = cell.BestsellerImageView.image {
            
                detailViewController.googleInfo = cell.googleBookInfo
                detailViewController.bookImage = image
                navigationController?.pushViewController(detailViewController, animated: true)
           
            } else {
                detailViewController.bookImage = UIImage(named: "icons8-book-50")
                 detailViewController.googleInfo = cell.googleBookInfo
                navigationController?.pushViewController(detailViewController, animated: true)
                
            }
            
        }

    }
}

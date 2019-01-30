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
    
    var bookCategories = [Books]() {
        didSet {
            DispatchQueue.main.async {
                self.mainView.bestSellerPickerView.reloadAllComponents()
            }
        }
    }
    
    var googleInfo = [BookInfo]()/*{
        didSet {
            DispatchQueue.main.async {
    
            }
        }
    } */
    
    var bookDetails = [BookData]() {
        didSet {
            DispatchQueue.main.async {
             self.mainView.myCollectionView.reloadData()
            }
        }
    }
    
    func getBooks() {
        NYTAPIClient.getBook { (appError, book) in
            if let appError = appError {
                print(appError.errorMessage())
            }
            if let data = book {
                self.bookCategories = data
//                dump(self.bookCategories)
            }
        }
    }
    
    
    func getMoreInfo() {
        GoogleAPIClient.getDetails { (appError, book) in
            if let appError = appError {
                print(appError.errorMessage())
            }
            if let data = book {
                self.googleInfo = data
                dump(self.googleInfo)
            }
        }
    }
    
    func getDetailedInfo() {
        DetailsAPIClient.getDetails { (appError, book) in
            if let appError = appError {
                print(appError.errorMessage())
            }
            if let data = book {
                self.bookDetails = data
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(mainView)
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //NYTAPIClient()
        getBooks()
        getMoreInfo()
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
        cell.WeeksLabel.text = "\(String(describing: bookDetails.first?.weeksOnList)) weeks on best seller list"
    cell.TextViewDescription.text = bookDetails.first?.bookDetails.description
        
//        cell.BestsellerImageView.image = UIImage(named: (collectionCV.first?.volumeInfo.imageLinks.thumbnail)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
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
    

}

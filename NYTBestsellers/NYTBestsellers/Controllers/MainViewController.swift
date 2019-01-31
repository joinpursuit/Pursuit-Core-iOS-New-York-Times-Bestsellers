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
    
            }
        }
    }
    
    var bookDetails = [BookData](){
        didSet {
            DispatchQueue.main.async {
             self.mainView.myCollectionView.reloadData()
                dump(self.bookDetails)
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
                //dump(self.googleInfo)
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
        //NYTAPIClient()
        getBooks()
        getMoreInfo()
        getDetailedInfo()
        mainView.myCollectionView.dataSource = self
        mainView.myCollectionView.delegate = self
        mainView.bestSellerPickerView.dataSource = self
        mainView.bestSellerPickerView.delegate = self
        //dump()
    }
}
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BooksCollectionViewCell", for: indexPath) as? BooksCollectionViewCell else { return UICollectionViewCell() }
        let cellInfo = bookDetails[indexPath.row]
    cell.WeeksLabel.text = "\(cellInfo.weeksOnList) weeks on best seller list"
    cell.TextViewDescription.text = cellInfo.bookDetails.first?.description
        cell.BestsellerImageView.image = UIImage(named: (googleInfo.first?.volumeInfo.imageLinks.smallThumbnail)!)
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

}
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}

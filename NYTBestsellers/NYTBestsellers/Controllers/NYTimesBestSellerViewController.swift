//
//  NYTimesBestSellerViewController.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTimesBestSellerViewController: UIViewController {
    let nyTimesCollection = BestSellerView()
    var userSelection = "Hardcover Advice"
    var onlineBooks = [ResultsOfBestSellerBooks](){
        didSet{
            DispatchQueue.main.async {
                self.nyTimesCollection.collectionViewCellObj.reloadData()
            }
        }
    }
    var nYBSCategories = [Category](){
        didSet{
            DispatchQueue.main.async {
                self.nyTimesCollection.pickerViewObj.reloadAllComponents()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NYT BestSellers"
        self.view.backgroundColor = .white
        view.addSubview(nyTimesCollection)
        nyTimesCollection.collectionViewCellObj.dataSource = self
        nyTimesCollection.collectionViewCellObj.delegate = self
        nyTimesCollection.pickerViewObj.dataSource = self
        nyTimesCollection.pickerViewObj.delegate =  self
       fetchNYBSCategory()
        fetchBooks()
    }
    func fetchNYBSCategory(){
        nYBSCategories = CategoryDataManager.fetchCategoriesFromDocumentsDirectory()
    }
    func fetchBooks(){
        NewYorkBestSellerApiClient.getBestSellerByCategory(category: userSelection) { (appError, onlineCategories) in
            if let appError = appError {
                print(appError.errorMessage())
            }
            if let onlineCategories = onlineCategories {
                self.onlineBooks = onlineCategories.resultsForCategory
                dump(self.onlineBooks)
                
            }
        }
    }
}

extension NYTimesBestSellerViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onlineBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellerCell", for: indexPath) as? BestSellerCell else {return UICollectionViewCell()}
        let settingBookCells = onlineBooks[indexPath.row]
       cell.titleLabelObj.text = "\(settingBookCells.NumberOfWeeksOnTheBestSellerList) weeks on best seller list"
        if let description = settingBookCells.moreBookInformation.first?.booksDescription {
           cell.bestSellerBookDescriptionTxtViewObj.text = description
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destination = DetailNYTBSViewController()
        self.navigationController?.pushViewController(destination, animated: true)
    }
}

extension NYTimesBestSellerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nYBSCategories.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return nYBSCategories[row].listName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userSelection = nYBSCategories[row].listName
    }
    
    
}

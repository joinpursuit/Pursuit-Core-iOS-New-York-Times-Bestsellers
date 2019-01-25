//
//  BestSellersViewController.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersViewController: UIViewController,UICollectionViewDataSource, UIPickerViewDataSource,UIPickerViewDelegate {
    
    let bestSellerVC = BestSellersView()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Best Sellers"
        view.addSubview(bestSellerVC)
        bestSellerVC.myPickerView.delegate = self
        bestSellerVC.myPickerView.dataSource = self
        bestSellerVC.myCollectionView.dataSource = self
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestSellerVC.bestSellerBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellersCell", for: indexPath) as? BestSellersCollectionViewCell else {return UICollectionViewCell()}
        let bookToSet = bestSellerVC.bestSellerBooks[indexPath.row]
        cell.bookNameLabel.text = "\(bookToSet.weeksOnList) weeks on best seller list"
        cell.bookDescription.text = bookToSet.bookDetails[0].description
        return cell
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bestSellerVC.listNames.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bestSellerVC.listNames[row].listName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedListName = bestSellerVC.listNames[row].listName
        APIClient.getBookDetails(listName: selectedListName) { (appError, data) in
            if let appError = appError{
                print(appError)
            }
            if let data = data{
                self.bestSellerVC.bestSellerBooks = data
            }
        }
    }
}

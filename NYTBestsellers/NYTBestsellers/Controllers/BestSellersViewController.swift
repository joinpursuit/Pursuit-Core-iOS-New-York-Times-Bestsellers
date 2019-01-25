//
//  BestSellersViewController.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersViewController: UIViewController {
    
    let bestSellersView = BestSellersView()
    private var bookListPickerViewData = [BookList]() {
        didSet {
            DispatchQueue.main.async {
                self.bestSellersView.pickerView.reloadAllComponents()
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(bestSellersView)
        
        bestSellersView.collectionView.dataSource = self
        
        bestSellersView.pickerView.dataSource = self
        bestSellersView.pickerView.delegate = self

        NYTAPIClient.getBookList { (appError, bookList) in
            if let appError = appError {
                print("error in getting book list - \(appError)")
            } else if let bookList = bookList {
                self.bookListPickerViewData = bookList
            }
        }
        
    }
    

}

extension BestSellersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = bestSellersView.collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as? BookCollectionViewCell else { return UICollectionViewCell() }
        cell.bookDescriptionTextView.text = "Waiting for data"
        cell.numberOfWeeksOnList.text = "Waititng for data"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
}

extension BestSellersViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bookListPickerViewData[row].list_name
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bookListPickerViewData.count
    }

}

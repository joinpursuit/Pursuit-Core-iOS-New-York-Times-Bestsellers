//
//  BestSellerVC.swift
//  NYTBestsellers
//
//  Created by Joshua Viera on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerVC: UIViewController {
    
    var bestSellerView = BestSellerView()
    var categorie = [BookListName.resultsWrapper](){
        didSet{
            DispatchQueue.main.async {
                self.bestSellerView.pickerView.reloadAllComponents()
            }
        }
    }
    var cellId = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       
        APIClient.getListNames { (error, categories) in
            if let error = error {
                print(error)
            }
            if let categories = categories {
                self.categorie = categories
            }
        }
        bestSellerView.collectionview.delegate = self
        bestSellerView.collectionview.dataSource = self
        bestSellerView.pickerView.delegate = self
        bestSellerView.pickerView.dataSource = self
        view.addSubview(bestSellerView)
    }
    
}
extension BestSellerVC : UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categorie.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categorie[row].listName
    }
}
extension BestSellerVC : UICollectionViewDataSource, UICollectionViewDelegate {
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
        }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = bestSellerView.collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BestSellerCell
            return cell
        }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        }
}

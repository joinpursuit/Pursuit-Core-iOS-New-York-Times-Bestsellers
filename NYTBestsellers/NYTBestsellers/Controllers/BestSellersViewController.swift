//
//  BestSellersViewController.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersViewController: UIViewController {
    let bestSellerView = BestSellerView()
    var genre = [Results](){
        didSet{
            DispatchQueue.main.async {
                self.bestSellerView.pickerView.reloadAllComponents()
            }
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        bestSellerView.colloectionView.register(BestSellerCell.self, forCellWithReuseIdentifier: "BestSellerCell")
        view.addSubview(bestSellerView)
       bestSellerView.pickerView.dataSource = self
        bestSellerView.pickerView.delegate = self
        getGenres()

    }
    private func getGenres(){
        APIClient.getGenres { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                self.genre = data
                
                }
        }
    }
}
extension BestSellersViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genre.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genre[row].listName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
    }
    
}


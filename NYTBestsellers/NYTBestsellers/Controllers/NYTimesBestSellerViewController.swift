//
//  NYTimesBestSellerViewController.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTimesBestSellerViewController: UIViewController {
     let numbers = ["0","1","2","3","4","5","6","7","8","9"]
    let nyTimesCollection = BestSellerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NYT BestSellers"
        self.view.backgroundColor = .white
        view.addSubview(nyTimesCollection)
        nyTimesCollection.collectionViewCellObj.dataSource = self
        nyTimesCollection.collectionViewCellObj.delegate = self
        nyTimesCollection.pickerViewObj.dataSource = self
        nyTimesCollection.pickerViewObj.delegate =  self
    }

}

extension NYTimesBestSellerViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellerCell", for: indexPath) as? BestSellerCell else {return UICollectionViewCell()}
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
        return numbers.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numbers[row]
    }
    
    
}

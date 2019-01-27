//
//  BestSellersViewController.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersViewController: UIViewController {
    
    let bestSellerView = BestSellersView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bestSellerView)
        bestSellerView.myBestSellerCollectionView.dataSource = self
        bestSellerView.myBestSellerCollectionView.delegate = self
        bestSellerView.myBestSellerPickerView.dataSource = self
        bestSellerView.myBestSellerPickerView.delegate = self

    }
}
extension BestSellersViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestCollectionViewCell", for: indexPath) as? BestCollectionViewCell else { return UICollectionViewCell()}
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let detailVC = DetailViewController()
        //let book = books[index.row]
        //detailVC.book = book
        //navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
extension BestSellersViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 30//number of book categories
    }
    
    
}

//
//  BestsellersViewController.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestsellersViewController: UIViewController {

    let bestsellersView = BestsellersView()
    private var bookGenres = [BestsellerGenre]() {
        didSet {
            DispatchQueue.main.async {
                self.bestsellersView.bestsellersPickerView.reloadAllComponents()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
self.view.backgroundColor = .white
        self.view.addSubview(bestsellersView)
        dump(bookGenres)
        
        bestsellersView.bestsellerCollectionView.dataSource = self
        bestsellersView.bestsellerCollectionView.delegate = self
        bestsellersView.bestsellersPickerView.delegate = self
        bestsellersView.bestsellersPickerView.dataSource = self
        APIClient.getGenres { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                self.bookGenres = data
            }
        }
    }
    

    

}
extension BestsellersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = bestsellersView.bestsellerCollectionView.dequeueReusableCell(withReuseIdentifier: "BestsellersCell", for: indexPath) as? BestsellersCollectionCell else { return UICollectionViewCell() }
        return cell
        
    }
    
    
}
extension BestsellersViewController: UICollectionViewDelegate {
    
}

extension BestsellersViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bookGenres.count
    }
    
    
}
extension BestsellersViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bookGenres[row].listName
        
    }
}


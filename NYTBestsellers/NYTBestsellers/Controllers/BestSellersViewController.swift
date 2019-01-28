//
//  BestSellersViewController.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
protocol PickerDelegate: AnyObject {
    func pickerWheel(genre: String)
}
class BestSellersViewController: UIViewController {
    weak var delegate: PickerDelegate?
    let bestSellerView = BestSellerView()
    var genre = [Results](){
        didSet{
            DispatchQueue.main.async {
                self.bestSellerView.pickerView.reloadAllComponents()
            }
        }
        
    }
    var books = [BookResults](){
        didSet{
            DispatchQueue.main.async {
                self.bestSellerView.colloectionView.reloadData()
            }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bestSellerView.colloectionView.register(BestSellerCell.self, forCellWithReuseIdentifier: "BestSellerCell")
        view.addSubview(bestSellerView)
        bestSellerView.pickerView.dataSource = self
        bestSellerView.pickerView.delegate = self
        bestSellerView.colloectionView.dataSource = self
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
    private func getBooks(keyword: String){
        APIClient.getBooks(keyword: keyword.replacingOccurrences(of: " ", with: "-") ) { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                self.books = data
                
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
        getBooks(keyword: genre[row].listName)
    }
    
}
extension BestSellersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellerCell", for: indexPath) as? BestSellerCell else { return UICollectionViewCell() }
        
        cell.label.text = books[indexPath.row].weeks_on_list.description
        cell.image.image = UIImage.init(named: "icons8-open_book")
        cell.textView.text = books[indexPath.row].book_details.first?.description
        return cell
    }
    
    
}



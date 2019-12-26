//
//  BestSellersViewController.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersViewController: UIViewController {
    public var row = 0

    public var defaulGenre = ""
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
    var images = [VolumeInfo](){
        didSet{
            DispatchQueue.main.async {
                self.bestSellerView.colloectionView.reloadData()
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            if let searchRow = UserDefaults.standard.object(forKey: UserDefaultKeys.pickerviewkey) as? Int {
                bestSellerView.pickerView.selectRow(searchRow, inComponent: 0, animated: true)
               DispatchQueue.main.async {
                   guard self.genre.count > 0 else { return }
                   self.getBooks(keyword: self.genre[searchRow].listName)
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
        bestSellerView.colloectionView.delegate = self
      if let searchRow = UserDefaults.standard.object(forKey: UserDefaultKeys.pickerviewkey) as? Int {
          if let searchWord = UserDefaults.standard.object(forKey: UserDefaultKeys.pickerviewkey2) as? String {
              defaulGenre = searchWord
              row = searchRow
              getBooks(keyword: defaulGenre)
          }
          
      }
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
        self.defaulGenre = genre[row].listName
        getBooks(keyword: defaulGenre)
        
    }
    
    
}
extension BestSellersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellerCell", for: indexPath) as? BestSellerCell else { return UICollectionViewCell() }
        cell.label.text = "Best seller for \(books[indexPath.row].weeks_on_list) weeks"
        
        APIClient.getGoogleImage(keyword: (books[indexPath.row].book_details.first?.primary_isbn13)!) { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                
                
                ImageHelper.fetchImageFromNetwork(urlString: data.imageLinks.smallThumbnail){ (error, image) in
                    if let error = error {
                        print(error.errorMessage())
                    }
                    if let image = image {
                      DispatchQueue.main.async {
                        cell.image.image = image

                      }
                    } else {
                        cell.image.image = UIImage(named: "icons8-book")
                    }
                }
                
            }
        }
        
        
        
        cell.textView.text = books[indexPath.row].book_details.first?.description
        
        return cell
    }
    
    
}
extension BestSellersViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let book = books[indexPath.row]
        
        
        let detailVC = DetailViewController()
        detailVC.theBooks = book
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
}



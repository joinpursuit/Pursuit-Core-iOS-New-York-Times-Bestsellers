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
    var cellId = "Cell"
    
    var category = [BookListName.resultsWrapper](){
        didSet{
            DispatchQueue.main.async {
                self.bestSellerView.pickerView.reloadAllComponents()
            }
        }
    }
    
    var book = [BestSellerBook.ResultsWrapper](){
        didSet{
            DispatchQueue.main.async {
                self.bestSellerView.collectionview.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIClient.getBookDetails(listName: "Manga") { (error, books) in
            if let error = error {
                print("Could not set Default Book: \(error)")
            }
            if let books = books {
                self.book = books
            }
        }
        getData()
        bestSellerView.collectionview.delegate = self
        bestSellerView.collectionview.dataSource = self
        bestSellerView.pickerView.delegate = self
        bestSellerView.pickerView.dataSource = self
        view.addSubview(bestSellerView)
    }
    
    
    func getData(){
        APIClient.getListNames { (error, categories) in
            if let error = error {
                print(error)
            }
            if let categories = categories {
                self.category = categories
            }
        }
    }
}

extension BestSellerVC : UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return category[row].listName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        APIClient.getBookDetails(listName: category[row].listName) { (error, books) in
            if let error = error {
                print("PickerViewDidSelectRow: \(error)")
            }
            if let books = books {
                self.book = books
            }
        }
    }
}
extension BestSellerVC : UICollectionViewDataSource, UICollectionViewDelegate {
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return book.count
        }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = bestSellerView.collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BestSellerCell
            
            let bookIWant = book[indexPath.row]
            if bookIWant.weeksOnList <= 1 {
                cell.nameLabel.text = "\(bookIWant.weeksOnList) Week on Best Seller List"

            } else {
            cell.nameLabel.text = "\(bookIWant.weeksOnList) Weeks on Best Seller List"
            }
            
            cell.descriptionTextView.text = bookIWant.bookDetails[0].description
          
            
            APIClient.getGoogleData(isbn: bookIWant.bookDetails[0].primaryIsbn10) { (error, image) in
                if let error = error {
                    print("Error Setting Image: \(error)")
                }
                if let image = image {
                    ImageHelper.fetchImageFromNetwork(urlString: image[0].volumeInfo.imageLinks.smallThumbnail, completion: { (error, image) in
                        if let error = error {
                            print("Image Helper Failed to find Photo: \(error)")
                        }
                        if let image = image {
                            cell.bookPhoto.image = image
                        }
                    })
                }
            }
            return cell
        }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let bookIWant = book[indexPath.row].bookDetails[0]
            let detailVC = BestSellerDetailVC(isbn: bookIWant.primaryIsbn10, description: bookIWant.description, book: bookIWant.title, author: bookIWant.author)
            navigationController?.pushViewController(detailVC, animated: true)
        }
}

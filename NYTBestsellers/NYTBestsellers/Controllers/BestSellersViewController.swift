//
//  BestSellersViewController.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersViewController: UIViewController {

    let bestSellers = BestSellersView()
    
    var keyword = "Hardcover-Nonfiction"
    
    var genre = [GenreType]() {
        didSet {
            DispatchQueue.main.async {
                self.bestSellers.genrePickerView.reloadAllComponents()
            }
        }
    }
    
    var bestSellingBooks = [Book]() {
        didSet {
            DispatchQueue.main.async {
                self.bestSellers.bestSellerCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "NYT Bestsellers"
        view.addSubview(bestSellers)
        bestSellers.bestSellerCollectionView.dataSource = self
        bestSellers.bestSellerCollectionView.delegate = self
        bestSellers.genrePickerView.dataSource = self
        bestSellers.genrePickerView.delegate = self
        getBookGenres()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        checkForDefault()
    }
    
    func getBookGenres() {
        NYTimesAPIClient.getGenre { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                self.genre = data
                self.checkForDefault()
            }
        }
    }
    
    func getBookInfo(keyword: String) {
        NYTimesAPIClient.getBooks(keyword: keyword) { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                self.bestSellingBooks = data
            }
        }
    }
    
    func checkForDefault() {
        if let genreDefault = UserDefaults.standard.object(forKey: DefaultKeys.genre){
            getBookInfo(keyword: genreDefault as! String)
        }
        if let pickedRow = (UserDefaults.standard.object(forKey: DefaultKeys.pickerRow)) as? String {
            DispatchQueue.main.async {
                self.bestSellers.genrePickerView.selectRow(Int(pickedRow)!, inComponent: 0, animated: true)
            }
        }
    }

}
extension BestSellersViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestSellingBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellerCell", for: indexPath) as? BestSellerCollectionViewCell else { return UICollectionViewCell() }
        let cellToSet = bestSellingBooks[indexPath.row]
        cell.bookLabel.text = "\(cellToSet.weeks_on_list) weeks on best seller list"
        cell.bookTextView.text = cellToSet.book_details[0].description
        cell.layer.borderWidth = 3
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = UIColor.black.cgColor
        GoogleAPIClient.getBookImages(keyword: cellToSet.book_details[0].primary_isbn13) { (error, data) in
            if let error = error {
                DispatchQueue.main.async {
                    cell.bookImage.image = UIImage(named: "bookplaceholder")
                }
                print(error.errorMessage())
            } else if let data = data {
                ImageHelper.fetchImageFromNetwork(urlString: data[0].volumeInfo.imageLinks.smallThumbnail.absoluteString, completion: { (error, image) in
                    if let error = error {
                        print(error.errorMessage())
                    } else if let image = image {
                        DispatchQueue.main.async {
                            cell.bookImage.image = image
                        }
                    }
                })
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = DetailViewController.init(isbn: bestSellingBooks[indexPath.row].book_details[0].primary_isbn13,
                                               author: bestSellingBooks[indexPath.row].book_details[0].author,
                                               description: bestSellingBooks[indexPath.row].book_details[0].description,
                                               weeks: bestSellingBooks[indexPath.row].weeks_on_list,
                                               amazonLink: bestSellingBooks[indexPath.row].amazon_product_url,
                                               bookTitle: bestSellingBooks[indexPath.row].book_details[0].title)
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    
}
extension BestSellersViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genre.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genre[row].list_name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        NYTimesAPIClient.getBooks(keyword: genre[row].list_name.replacingOccurrences(of: " ", with: "-")) { (error, book) in
            if let error = error {
                print(error.errorMessage())
            } else if let book = book {
                self.bestSellingBooks = book
            }
        }
    }
    
}

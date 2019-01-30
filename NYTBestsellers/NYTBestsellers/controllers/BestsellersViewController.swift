//
//  BestsellersViewController.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit



class BestSellerViewController: UIViewController {
    let bestSeller = BestSellerView()
    public var keyword = ""
    private var categories = [Results](){
        didSet {
            DispatchQueue.main.async {
                self.bestSeller.bestSellerPickerView.reloadAllComponents()
            }
        }
    }
    private var bookResults = [BookResults]() {
        didSet {
            DispatchQueue.main.async {
                self.bestSeller.BestSellerCollectionView.reloadData()
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(bestSeller)
        bestSeller.BestSellerCollectionView.delegate = self
        bestSeller.BestSellerCollectionView.dataSource = self
        bestSeller.bestSellerPickerView.dataSource = self
        bestSeller.bestSellerPickerView.delegate = self
        getCategories()
        if let searchCategory = UserDefaults.standard.object(forKey: UserdDefaultKey.pickerviewkey) as? String {
            keyword = searchCategory
            getBookResults(category: keyword)
        }
        
        
    }
    
    private func getCategories() {
        bookAPIClient.getBooksCategory{ (appError, categories) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let categories = categories {
                self.categories = categories
            }
        }
    }
    
    private func getBookResults(category: String) {
        bookAPIClient.getBookNames(keyword: category.replacingOccurrences(of: " ", with: "-")) { (error, bookResults) in
            if let error = error {
                print(error.errorMessage())
            } else if let bookResults = bookResults {
                self.bookResults = bookResults
            }
        }
    }
}

extension BestSellerViewController: UICollectionViewDelegateFlowLayout {
    
}


extension BestSellerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? CollectionViewCell else {return UICollectionViewCell() }
        let results = bookResults[indexPath.row]
        cell.bestSellerCollectionLabel.text = results.book_details.first?.title
        cell.bestSellerTextView.text = results.book_details.first?.description
        bookAPIClient.getImageURL(identifier: (results.book_details.first?.primary_isbn13)!) { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                ImageHelper.fetchImageFromNetwork(urlString: data.imageLinks.smallThumbnail){ (error, image) in
                    if let error = error {
                        print(error.errorMessage())
                    } else if let image = image {
                        cell.bestSellerCollectionCellImage.image = image
                    }
                }
            }
        }
        return cell
    }
    
    

    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailController = DetailViewController()
            guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell else { return }
        detailController.detailview.detailImage.image = cell.bestSellerCollectionCellImage.image
        detailController.detailview.detailLabel.text = cell.bestSellerCollectionLabel.text
        detailController.detailview.detailTextView.text = cell.bestSellerTextView.text
        self.navigationController?.pushViewController(detailController, animated: true)
        
    }
}

extension BestSellerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row].list_name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.keyword = categories[row].list_name
        getBookResults(category: keyword)
    }
    
    
}

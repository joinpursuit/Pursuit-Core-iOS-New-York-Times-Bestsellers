//
//  NYTimesBestSellerViewController.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerVC: UIViewController {
    let nyTimesCollection = BestSellerView()
   public var userSelection = "" {
        didSet{
            fetchBooks()
        }
    }
    var onlineCovers =  [GoogleBookImageInfo]()
    var onlineBooks = [ResultsOfBestSellerBooks](){
        didSet{
            DispatchQueue.main.async {
                self.nyTimesCollection.collectionViewCellObj.reloadData()
            }
        }
    }
    var nYBSCategories = [Category](){
        didSet{
            DispatchQueue.main.async {
                self.nyTimesCollection.pickerViewObj.reloadAllComponents()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NYT BestSellers"
        self.view.backgroundColor = .white
        view.addSubview(nyTimesCollection)
        nyTimesCollection.collectionViewCellObj.dataSource = self
        nyTimesCollection.collectionViewCellObj.delegate = self
        nyTimesCollection.pickerViewObj.dataSource = self
        nyTimesCollection.pickerViewObj.delegate =  self
        fetchNYBSCategory()
        fetchBooks()
        setupUserDefaultSettings()
    }
    fileprivate func setupUserDefaultSettings() {
        if let selection = UserDefaults.standard.object(forKey: DefaultKeys.key) as? String {
            userSelection = selection
        } else {
            print("has not been save")
        }
    }
    func fetchNYBSCategory(){ //sets the picker view by category using the Documents Directory to fetch the list of names
        nYBSCategories = CategoryDataManager.fetchCategoriesFromDocumentsDirectory()
    }
    func fetchBooks(){// gets the NYT Best Sellers Book From thr ApiClient from the second Endpoint
        BestSellerApiClient.getBestSellerByCategory(category: userSelection) { (appError, onlineCategories) in
            if let appError = appError {
                print(appError.errorMessage())
            }
            if let onlineCategories = onlineCategories {
                self.onlineBooks = onlineCategories.resultsForCategory
            }
        }
    }
}
extension BestSellerVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onlineBooks.count
    }
//    fileprivate func getGoogleBookCover(_ settingBookCells: ResultsOfBestSellerBooks, _ cell: BestSellerCell) {
//
//    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellerCell", for: indexPath) as? BestSellerCell else {return UICollectionViewCell()}
        let settingBookCells = onlineBooks[indexPath.row]
//        getGoogleBookCover(settingBookCells, cell) //gets the book image covers from the google api using the image helper
        if let isbn = settingBookCells.isbns.first?.isbn13  {
            GoogleApi.searchForBookCovers(isbnNumber: isbn) { (error, imageData) in
                if let error = error {
                    print("error is \(error)")
                }
                if let imageData = imageData {
                    ImageHelper.fetchImageFromNetwork(urlString: imageData.imageLinks.smallThumbnail, completion: { (appError, image) in
                        if let appError = appError {
                            print("\(appError)")
                        }
                        if let image = image {
                            cell.imageObj.image = image
                        }
                    })
                }
                
            }
        } else {
            print("no isbn found")
        }
       cell.titleLabelObj.text = "\(settingBookCells.NumberOfWeeksOnTheBestSellerList) weeks on best seller list"
        if let description = settingBookCells.moreBookInformation.first?.booksDescription {
           cell.bestSellerBookDescriptionTxtViewObj.text = description
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destination = DetailBSVC()
        guard let cell = collectionView.cellForItem(at: indexPath) as? BestSellerCell else {
            print("cant segue items to the detail cell")
            return
        }
        destination.detailDestination.detailTitleLabelObj.text = cell.titleLabelObj.text
       destination.detailDestination.detailDescriptionTextViewObj.text = cell.bestSellerBookDescriptionTxtViewObj.text
        self.navigationController?.pushViewController(destination, animated: true)
    }
}
extension BestSellerVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nYBSCategories.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return nYBSCategories[row].listName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userSelection = nYBSCategories[row].listName
    }
}

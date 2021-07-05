//
//  BookDetailsController.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BookDetailsController: UIViewController {
  
  var detailedViewInstance = DetailedView()
  
  public var bookInDetail: BookGeneralInfo?
  
  public var imageForDetailed: UIImage?
  
  public var descriptionFromGoodle: String?
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    self.view.addSubview(detailedViewInstance)
    
    let favoriteButton = UIBarButtonItem(title: "Favorite", style: UIBarButtonItem.Style.plain, target: self, action: #selector (BookDetailsController.favoriteButtonTapped(_:)))
    self.navigationItem.rightBarButtonItem = favoriteButton
    
    setupUI()
    
  }
  
  
  @objc func favoriteButtonTapped(_ sender: UIBarButtonItem!) {
    
    
    let weeksOnBestSeller = bookInDetail?.weeksOnList.description ?? "no weeks on best seller"
    let bookDesription = descriptionFromGoodle ?? "no book description"
    
    let favoriteBook = FavoriteBook.init(imageData: imageForDetailed?.jpegData(compressionQuality: 0.5),
                                         weeksOnBestSellerList: weeksOnBestSeller,
                                         bookDescription: bookDesription,
                                         createdAt: Date.getISOTimestamp())
    
    FavoritesDataManager.addEntry(book: favoriteBook)
    
    
    let alert = UIAlertController.init(title: "Book was saved", message: nil, preferredStyle: .alert)
    let ok = UIAlertAction.init(title: "Ok", style: .default) { (UIAlertAction) in
      self.dismiss(animated: true, completion: nil)
    }
    alert.addAction(ok)
    present(alert, animated: true, completion: nil)
  }
  
  func setupUI() {
    if let author = bookInDetail?.bookDetails[0].author {
      detailedViewInstance.authorName.text = "Author: \(author)"
    }
    
    if let extendedBookDescription = descriptionFromGoodle {
      detailedViewInstance.bookDescription.text = extendedBookDescription
    }
    
    detailedViewInstance.amazonLaunchButton.setImage(UIImage(named: "amazonLogo"), for: .normal)
    
    if let image = imageForDetailed{
      detailedViewInstance.bookCover.image = image
    }
  }
}

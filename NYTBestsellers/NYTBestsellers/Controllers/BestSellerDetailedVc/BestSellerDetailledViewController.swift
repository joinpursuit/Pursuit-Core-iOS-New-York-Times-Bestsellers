//
//  BestSellerDetailledViewController.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerDetailledViewController: UIViewController {
  
  let detailledView = DetailledView()
  var newBook: NewBook?
 
  
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
     self.view.addSubview(detailledView)
      self.title = "Book Name"
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector (saveFavorites))
      setUpUi()
  }
  
  func setUpUi(){
    detailledView.bookCoverImageView.image = newBook?.bookCover
    detailledView.DescriptiontextView.text = newBook?.description
    detailledView.infoLabel.text = newBook?.authorName
  }

  @objc func saveFavorites(){
    let newItem: NewBookCodable?
    do{
    let data = newBook?.bookCover?.jpegData(compressionQuality: 0.5)
      newItem = NewBookCodable.init(authorName: newBook?.authorName ?? "no name found", description: newBook?.description ?? "no description found", bookName: newBook?.bookName ?? "no book name found", imageData: data)
      PersistanceHelper.addItemsToDirectory(entry: newItem!)
    }
  }

}

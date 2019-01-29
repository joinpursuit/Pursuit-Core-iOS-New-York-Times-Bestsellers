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
    
    setupUI()
    
  }
  

  
  func setupUI() {
    if let author = bookInDetail?.book_details[0].author {
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

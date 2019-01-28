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
  

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .lightGray
      self.view.addSubview(detailedViewInstance)
      
    }
    


}

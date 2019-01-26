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
  
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
     self.view.addSubview(detailledView)
      self.title = "Book Name"
  }
    

  

}

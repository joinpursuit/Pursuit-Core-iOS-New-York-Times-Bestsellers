//
//  DetailViewController.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    //lazy var book
    //when saving a book, tab bar stuff. 

    let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailView)
        
    }
    
    
//    init() {
//        super.init(nibName: nil, bundle: nil)
////        detailView.detailLabel.text = "Label"
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}

//
//  NYTDetailBestSellingController.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTDetailBestSellingController: UIViewController {
    
    let nYTDetailBestSellingView = NYTDetailBestSellingView()
    
    var nYTBook: NYTBook!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(nYTDetailBestSellingView)
    }
    
    init (book: NYTBook) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

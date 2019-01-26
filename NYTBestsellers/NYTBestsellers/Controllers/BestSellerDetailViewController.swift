//
//  BestSellerDetailViewController.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerDetailViewController: UIViewController {
    
    let detailVC = DetailView()
    var url = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailVC)
        updateUI(urlString: url)
        // Do any additional setup after loading the view.
    }
    
    func updateUI(urlString: String){
        if urlString == "bookPlaceholder"{
            detailVC.detailBookImage.image = UIImage(named: "bookPlaceholder")
        } else if let image = ImageHelper.fetchImageFromCache(urlString: urlString){
            detailVC.detailBookImage.image = image
        } else {
            ImageHelper.fetchImageFromNetwork(urlString: urlString) { (appError, image) in
                if let appError = appError {
                    print(appError.errorMessage())
                }
                if let image = image{
                    self.detailVC.detailBookImage.image = image
                }
            }
        }
    }
    init(photoToSet: String) {
        super.init(nibName: nil, bundle: nil)
        url = photoToSet
        
        
//        detailView.myLabel.text = message
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

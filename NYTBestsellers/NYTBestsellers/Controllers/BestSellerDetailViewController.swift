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
    var isbn = String()
    var bookDescription = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailVC)
        updateUI(isbn: isbn)
        
        // Do any additional setup after loading the view.
    }
    
    func updateUI(isbn: String){
        APIClient.getGoogleData(isbn: isbn) { (appError, data) in
            if let appError = appError {
                print(appError)
                DispatchQueue.main.async {
                    self.detailVC.detailBookImage.image = UIImage(named: "bookPlaceholder")
                    self.detailVC.detailBookTextView.text = self.bookDescription
                }
            }
            if let data = data{
                DispatchQueue.main.async {
                    self.detailVC.detailBookTextView.text = data[0].volumeInfo.description
                }
                if let image = ImageHelper.fetchImageFromCache(urlString: data[0].volumeInfo.imageLinks.thumbnail){
                    self.detailVC.detailBookImage.image = image
                } else {
                    ImageHelper.fetchImageFromNetwork(urlString: data[0].volumeInfo.imageLinks.smallThumbnail) { (appError, image) in
                        if let appError = appError {
                            print(appError.errorMessage())
                        } else if let image = image{
                            self.detailVC.detailBookImage.image = image
                            
                        }
                    }
                }
            }
        }
    }
    init(isbn: String, description: String) {
        super.init(nibName: nil, bundle: nil)
        self.isbn = isbn
        self.bookDescription = description
        
        
//        detailView.myLabel.text = message
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

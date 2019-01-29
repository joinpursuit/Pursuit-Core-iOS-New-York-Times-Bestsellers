//
//  DetailViewController.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
 let detailView = DetailView()
    var theBooks: BookResults!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        detailView.label.text = theBooks.book_details.first?.title
        detailView.textView.text = theBooks.book_details.first?.description
        APIClient.getGoogleImage(keyword: (theBooks.book_details.first?.primary_isbn13)!) { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                
                
                ImageHelper.fetchImageFromNetwork(urlString: data.imageLinks.smallThumbnail){ (error, image) in
                    if let error = error {
                        print(error.errorMessage())
                    }
                    if let image = image {
                        self.detailView.image.image = image
                    }
                }
                
            }
        }
    }
    


}

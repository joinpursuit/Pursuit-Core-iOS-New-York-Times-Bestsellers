//
//  DetailViewController.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
    let detailview = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailview)
        title = "Detail"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Favorite", style: .plain, target: self, action: #selector(addToFavorite))
    }
    
    @objc private func addToFavorite() {
        
    }
    
}

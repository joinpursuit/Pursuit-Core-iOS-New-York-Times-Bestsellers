//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    let favoritesView = FavoritesView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(favoritesView)
        self.view.backgroundColor = .yellow 
    }


}

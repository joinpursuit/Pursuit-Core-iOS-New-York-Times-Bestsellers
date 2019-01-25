//
//  FavoriteViewController.swift
//  NYTBestsellers
//
//  Created by Biron Su on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    let favoriteView = FavoriteView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(favoriteView)
        navigationItem.title = "Favorites"
    }

}

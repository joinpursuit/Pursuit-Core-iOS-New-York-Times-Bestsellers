//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    let favoritesView = FavoritesView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        favoritesView.colloectionView.register(FavoritesCell.self, forCellWithReuseIdentifier: "Favorites")
        view.addSubview(favoritesView)
    }
    


}

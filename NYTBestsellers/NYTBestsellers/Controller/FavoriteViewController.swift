//
//  FavoriteViewController.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    let favoriteView = FavoriteView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(favoriteView)
        favoriteView.delegate = self
    }
    
}

extension FavoriteViewController: FavoriteViewDelegate {
    func numberOfFavoriteBooks() -> Int {
        <#code#>
    }
    
    func configureCollectionViewCell(indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}

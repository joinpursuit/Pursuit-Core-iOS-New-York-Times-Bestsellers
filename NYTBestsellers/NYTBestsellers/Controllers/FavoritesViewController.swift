//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    let favoritesView = FavoriteBookView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
        self.view.backgroundColor = .red
        view.addSubview(favoritesView)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

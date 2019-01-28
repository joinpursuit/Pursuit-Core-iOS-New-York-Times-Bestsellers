//
//  NYTBestsellersViewController.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTBestsellersViewController: UIViewController {
    
    let bestsellerView = BestsellersView()
    let arrayToSet: [String] = ["bestseller", "bestseller", "bestseller", "bestseller"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = BestsellersView()
        self.view.backgroundColor = .red
        view.addSubview(bestsellerView)
        bestsellerView.bestSellerCollectionView.dataSource = self
    }
    
}

extension NYTBestsellersViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestsellersCell", for: indexPath) as? BestsellersCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}

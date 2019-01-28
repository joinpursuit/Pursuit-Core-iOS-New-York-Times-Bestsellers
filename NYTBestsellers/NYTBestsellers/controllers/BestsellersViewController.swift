//
//  BestsellersViewController.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit



class BestSellerViewController: UIViewController {
    let bestSeller = BestSellerView()
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.view.addSubview(bestSeller)
    bestSeller.BestSellerCollectionView.delegate = self
        bestSeller.BestSellerCollectionView.dataSource = self

    }
}

extension BestSellerViewController: UICollectionViewDelegateFlowLayout {
    
}


extension BestSellerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? CollectionViewCell else {return UICollectionViewCell() }
     
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
    }
    
    
}

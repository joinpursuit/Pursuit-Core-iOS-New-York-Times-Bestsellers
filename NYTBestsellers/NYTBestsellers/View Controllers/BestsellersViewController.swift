//
//  BestsellersViewController.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestsellersViewController: UIViewController {

    let bestsellersView = BestsellersView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.view.backgroundColor = .white
        self.view.addSubview(bestsellersView)
        bestsellersView.bestsellerCollectionView.dataSource = self
        bestsellersView.bestsellerCollectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    

    

}
extension BestsellersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = bestsellersView.bestsellerCollectionView.dequeueReusableCell(withReuseIdentifier: "BestsellersCell", for: indexPath) as? BestsellersCollectionCell else { return UICollectionViewCell() }
        return cell
        
    }
    
    
}
extension BestsellersViewController: UICollectionViewDelegate {
    
}



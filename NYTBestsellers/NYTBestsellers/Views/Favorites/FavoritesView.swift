//
//  FavoritesView.swift
//  NYTBestsellers
//
//  Created by Joshua Viera on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesView: UIView {

    
    var myCollectionView: UICollectionView!
    var favCellId = "Fav"
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        fatalError("init(coder:) failed to implement")
    }
    private func commonInit() {
        backgroundColor = .gray
        setupViews()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        addSubview(myCollectionView)
        myCollectionView.register(FavoriteCell.self, forCellWithReuseIdentifier: favCellId)
    }


}
extension FavoritesView : UICollectionViewDelegate, UICollectionViewDataSource {
    
    private func setupViews(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.frame.width, height: 200)
        
        myCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        myCollectionView.showsVerticalScrollIndicator = false
        myCollectionView.backgroundColor = .black
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: favCellId, for: indexPath) as! FavoriteCell
        return cell
    }
}

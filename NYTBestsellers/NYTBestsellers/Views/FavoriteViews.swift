//
//  FavoriteViews.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteViews: UIView {
  
  
  lazy var favoritesCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: self.bounds.width - 40, height: (self.bounds.height) / 2)
    layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    layout.scrollDirection = .vertical
    
    let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
    collectionView.backgroundColor = #colorLiteral(red: 0.9257920923, green: 0.9627893281, blue: 0.9841015494, alpha: 1)
    
    return collectionView
    
  }()
  
  lazy var actionSheetSetup: UIAlertController = {
    var actionSheet = UIAlertController(title: "", message: "Pick an option:", preferredStyle: UIAlertController.Style.actionSheet)
    
    actionSheet.addAction(UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive, handler: { (delete) in
      
    }))
    
    actionSheet.addAction(UIAlertAction(title: "See on Amazon", style: UIAlertAction.Style.default, handler: { (linkToAmazon) in
      
    }))
    
    actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { (cancel) in
      
    }))
    
    //    self.presentViewController(myActionSheet, animated: true, completion: nil)
    return actionSheet
  }()
  

  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    addSubview(favoritesCollectionView)
    setFavoritesView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension FavoriteViews {
  private func setFavoritesView() {
    collectionViewConstraints()
  }
  
  
  func collectionViewConstraints() {
    favoritesCollectionView.translatesAutoresizingMaskIntoConstraints = false
    favoritesCollectionView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    favoritesCollectionView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
    favoritesCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor).isActive = true
    favoritesCollectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive =  true
  }
}

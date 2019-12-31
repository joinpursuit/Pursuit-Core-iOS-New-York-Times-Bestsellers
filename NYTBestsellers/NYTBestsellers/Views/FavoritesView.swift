//
//  FavoritesView.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesView: UIView {
  
  public lazy var colloectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize.init(width: 370, height: 350) // cell size
    layout.scrollDirection = .vertical
    layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
    let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
    collectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    return collectionView
  }()
  
  
  override init(frame: CGRect) {
    super .init(frame: UIScreen.main.bounds)
    
    
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit(){
    backgroundColor = .white
    setUpView()
  }
}
extension FavoritesView {
  private func setUpView(){
    setUpCollectionView()
    
  }
  func setUpCollectionView(){
    addSubview(colloectionView)
    colloectionView.translatesAutoresizingMaskIntoConstraints = false
    colloectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    colloectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    colloectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    colloectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true    }
  
}




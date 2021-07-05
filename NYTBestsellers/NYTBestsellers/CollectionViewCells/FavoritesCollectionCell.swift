//
//  FavoritesCollectionCell.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

protocol MoreActionsDelegate: AnyObject {
  func moreActionsButtonPressed()
}

class FavoritesCollectionCell: UICollectionViewCell {
  
  var delegate: MoreActionsDelegate?
  
  lazy var moreActions: UIButton = {
    let button = UIButton()
    button.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    button.setTitle(". . .", for: .normal)
    button.setTitleColor(UIColor.blue, for: .normal)
    
    button.addTarget(self, action: #selector(moreActionsButtonPressed), for: .touchUpInside)
    
    return button
  }()
  
  @objc func moreActionsButtonPressed() {
    delegate?.moreActionsButtonPressed()
  }
  
  lazy var imageCover: UIImageView = {
    let image = UIImageView(image: UIImage(named: "book"))
    return image
  }()
  
  lazy var weeksLabel: UILabel = {
    let label = UILabel()
    label.text = "weeks on best seller list"
    label.textColor = #colorLiteral(red: 0.06274510175, green: 0.1205586473, blue: 0.3033512155, alpha: 1)
    label.textAlignment = .center
    return label
  }()
  
  lazy var bookDescription: UITextView = {
    let tv = UITextView()
    tv.text = "text goes here and here and here and here and here and here"
    tv.textAlignment = .justified
    tv.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    return tv
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    addSubview(imageCover)
    addSubview(weeksLabel)
    addSubview(bookDescription)
    addSubview(moreActions)
    setupCellElements()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  
}

extension FavoritesCollectionCell {
  private func setupCellElements() {
    imageConstraints()
    weeksLabelConstraints()
    bookDescriptionConstraints()
    moreActionsConstraints()
  }
  
  private func imageConstraints() {
    imageCover.translatesAutoresizingMaskIntoConstraints = false
    imageCover.topAnchor.constraint(equalTo: topAnchor, constant: 11).isActive = true
    imageCover.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    imageCover.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
    imageCover.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }
  
  private func weeksLabelConstraints() {
    weeksLabel.translatesAutoresizingMaskIntoConstraints = false
    weeksLabel.topAnchor.constraint(equalTo: imageCover.bottomAnchor, constant: 8).isActive = true
    weeksLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
    weeksLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    
  }
  
  private func bookDescriptionConstraints() {
    bookDescription.translatesAutoresizingMaskIntoConstraints = false
    bookDescription.topAnchor.constraint(equalTo: weeksLabel.bottomAnchor, constant: 5).isActive = true
    bookDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
    bookDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    bookDescription.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
  }
  
  private func moreActionsConstraints() {
    moreActions.translatesAutoresizingMaskIntoConstraints = false
    moreActions.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
    moreActions.leadingAnchor.constraint(equalTo: imageCover.trailingAnchor, constant: 11).isActive = true
    moreActions.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
  }
}

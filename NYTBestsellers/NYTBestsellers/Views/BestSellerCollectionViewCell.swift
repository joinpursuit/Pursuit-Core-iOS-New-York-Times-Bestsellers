//
//  BestSellerCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
class BestSellerCollectionViewCell: UICollectionViewCell {
  let bookCoverImageView:UIImageView = {
    let iv = UIImageView()
    iv.image = #imageLiteral(resourceName: "placeholder")
    return iv
  }()
  
  let infoLabel:UILabel = {
    let label = UILabel()
    label.backgroundColor = #colorLiteral(red: 0.6892663836, green: 0.4962773919, blue: 0.4208119512, alpha: 1)
    label.textColor = .black
    label.text = "Hello my name is Ashli"
    label.textAlignment = .center
    label.layer.masksToBounds = true
    label.layer.cornerRadius = 14.0
    label.font = UIFont(name: "Times", size: 22)
    label.font = UIFont.boldSystemFont(ofSize: 22)
    return label
  }()
  let descriptiontextView:UITextView = {
    let textView = UITextView()
    textView.backgroundColor = #colorLiteral(red: 0.6892663836, green: 0.4962773919, blue: 0.4208119512, alpha: 1)
    textView.textColor = .black
    textView.text = "Hello nice gal enjoy your self"
    textView.isEditable = false
    textView.font = UIFont(name: "Times", size: 20)
    textView.textAlignment = .center
    textView.layer.cornerRadius = 22.0
    return textView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    prepareForReuse()
    setConstraints()
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  private func setConstraints(){
    imageViewConstraints()
    labelConstraints()
    textViewConstraints()
  }
  
  
  private func imageViewConstraints(){
    addSubview(bookCoverImageView)
    bookCoverImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint(item: bookCoverImageView, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
    NSLayoutConstraint(item: bookCoverImageView, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 0.555, constant: 0).isActive = true
    NSLayoutConstraint(item: bookCoverImageView, attribute: .height, relatedBy: .equal, toItem: self.contentView, attribute: .height, multiplier: 0.5, constant: 0).isActive = true
    NSLayoutConstraint(item: bookCoverImageView, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.5, constant: 0).isActive = true
    
  }
  
  private func labelConstraints(){
    addSubview(infoLabel)
    
    infoLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint(item: infoLabel, attribute: .top, relatedBy: .equal, toItem: bookCoverImageView, attribute: .bottom, multiplier: 1, constant: 8).isActive = true
    NSLayoutConstraint(item: infoLabel, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 1, constant: 0).isActive = true
  }
  
  private func textViewConstraints(){
    addSubview(descriptiontextView)
    descriptiontextView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint(item: descriptiontextView, attribute: .top, relatedBy: .equal, toItem: infoLabel, attribute: .bottom, multiplier: 1.0, constant: 8).isActive = true
    NSLayoutConstraint(item: descriptiontextView, attribute: .bottom, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint(item: descriptiontextView, attribute: .width, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint(item: descriptiontextView, attribute: .height, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .height, multiplier: 0.299, constant: 0).isActive = true
    
    
  }
}

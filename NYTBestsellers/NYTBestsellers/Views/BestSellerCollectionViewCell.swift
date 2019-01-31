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
    label.backgroundColor = .white
    label.textColor = .black
    label.text = "Hello my name is Ashli"
    label.textAlignment = .center
    return label
  }()
  let descriptiontextView:UITextView = {
    let textView = UITextView()
    textView.backgroundColor = .white
    textView.textColor = .black
    textView.text = "Hello nice gal enjoy your self"
    return textView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    self.backgroundColor = .white
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
    NSLayoutConstraint(item: bookCoverImageView, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.6, constant: 0).isActive = true
  
  }
  
  private func labelConstraints(){
    addSubview(infoLabel)
    infoLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint(item: infoLabel, attribute: .top, relatedBy: .equal, toItem: bookCoverImageView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    NSLayoutConstraint(item: infoLabel, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 1, constant: 0).isActive = true
  }
  
  private func textViewConstraints(){
    addSubview(descriptiontextView)
    descriptiontextView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint(item: descriptiontextView, attribute: .top, relatedBy: .equal, toItem: infoLabel, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint(item: descriptiontextView, attribute: .bottom, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint(item: descriptiontextView, attribute: .width, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint(item: descriptiontextView, attribute: .height, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .height, multiplier: 0.299, constant: 0).isActive = true
    
//    DescriptiontextView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 11).isActive = true
//    DescriptiontextView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
//    DescriptiontextView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
  }
}

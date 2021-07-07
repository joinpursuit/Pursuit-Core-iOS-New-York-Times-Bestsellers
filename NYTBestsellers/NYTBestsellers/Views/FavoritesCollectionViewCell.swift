//
//  FavoritesCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

protocol FavoritesCollectionViewCellDelegate:AnyObject {
  func presentAlertController(alertController:UIAlertController)
  func deleteFromFaves(index:Int)
}

class FavoritesCollectionViewCell: UICollectionViewCell {
  weak var delegate: FavoritesCollectionViewCellDelegate?
  
  let bookCoverImageView:UIImageView = {
    let iv = UIImageView()
    iv.image = #imageLiteral(resourceName: "placeholder.png")
    return iv
  }()
  let infoLabel:UILabel = {
    let label = UILabel()
    label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    label.textColor = .black
    label.text = "Hello my name is Ashli"
    label.textAlignment = .center
    label.layer.masksToBounds = true
    label.layer.cornerRadius = 10.0
    return label
  }()
  let DescriptiontextView:UITextView = {
    let textView = UITextView()
    textView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    textView.textColor = .black
    textView.text = "Hello nice gal enjoy your self"
    textView.font = UIFont(name: "Times", size: 20.0)
    textView.layer.cornerRadius = 17.0
    return textView
  }()
  lazy var expandButton:UIButton = {
    let button = UIButton()
    button.backgroundColor = #colorLiteral(red: 0.8111895323, green: 0.6748743653, blue: 0.6124779582, alpha: 1)
    button.setTitleColor(.white, for: .normal)
    button.setImage(#imageLiteral(resourceName: "icons8-more-filled-25.png"), for: .normal)
    button.addTarget(self, action: #selector(expandButtonPressed), for: .touchUpInside)
    
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = #colorLiteral(red: 0.8111895323, green: 0.6748743653, blue: 0.6124779582, alpha: 1)
    setConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setConstraints(){
    imageViewConstraints()
    labelConstraints()
    textViewConstraints()
    expandButtonConstraints()
    prepareForReuse()
  }
  
  @objc func expandButtonPressed(){
    let alertController = UIAlertController(title: "More Options", message: "What would you like to do?", preferredStyle: .actionSheet)
    let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (delete) in
      self.delegate?.deleteFromFaves(index: self.expandButton.tag)
      
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    let seeOnAmazon = UIAlertAction(title: "See on Amazon", style: .default) { (amazon) in
      print("amazon")
    }
    alertController.addAction(deleteAction)
    alertController.addAction(seeOnAmazon)
    alertController.addAction(cancelAction)
    
    delegate?.presentAlertController(alertController: alertController)
    
    
  }
  private func imageViewConstraints(){
    addSubview(bookCoverImageView)
    bookCoverImageView.translatesAutoresizingMaskIntoConstraints = false
    bookCoverImageView.topAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 0.9999).isActive = true
    bookCoverImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: CGFloat(-200)).isActive = true
    bookCoverImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: CGFloat(0.60)).isActive = true
    bookCoverImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(95)).isActive = true
    bookCoverImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -90).isActive = true
    
  }
  
  private func labelConstraints(){
    addSubview(infoLabel)
    infoLabel.translatesAutoresizingMaskIntoConstraints = false
    let theConstraints = [
      infoLabel.topAnchor.constraint(equalTo: bookCoverImageView.bottomAnchor, constant: 8.0),infoLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1.0)
    ]
    theConstraints.forEach{$0.isActive = true}
    
  }
  
  private func textViewConstraints(){
    addSubview(DescriptiontextView)
    DescriptiontextView.translatesAutoresizingMaskIntoConstraints = false
    let theConstraints = [
      DescriptiontextView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 8), DescriptiontextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor) , DescriptiontextView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor)
    ]
    theConstraints.forEach{$0.isActive = true}
    
  }
  private func expandButtonConstraints(){
    addSubview(expandButton)
    expandButton.translatesAutoresizingMaskIntoConstraints = false
    let theConstraints = [ expandButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),expandButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
    ]
    theConstraints.forEach{$0.isActive = true}
  }
}


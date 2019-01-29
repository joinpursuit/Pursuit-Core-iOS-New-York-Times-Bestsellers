//
//  DetailedView.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailedView: UIView {
  
  lazy var bookCover: UIImageView = {
    let image = UIImageView(image: UIImage(named: "book"))
    return image
  }()
  
  lazy var authorName: UILabel = {
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
    tv.isEditable = false
    return tv
  }()
  
  lazy var amazonLaunchButton: UIButton = {
    let button = UIButton()
    button.imageView?.image = UIImage(named: "amazonLogo")
    button.backgroundColor = .blue
    //    button.setTitle("Segue", for: .normal)
    
    //    button.addTarget(self, action: #selector(seguePressed), for: .touchUpInside)
    
    return button
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    addSubview(bookCover)
    addSubview(authorName)
    addSubview(bookDescription)
    addSubview(amazonLaunchButton)
    setupDetailedViewConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension DetailedView {
  
  private func setupDetailedViewConstraints() {
    imageConstraints()
    authorLabelConstraints()
    bookDescriptionConstraints()
    amazonLaunchConstraints()
    
  }
  
  private func imageConstraints() {
    bookCover.translatesAutoresizingMaskIntoConstraints = false
    bookCover.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
    bookCover.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    bookCover.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.6).isActive = true
    bookCover.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }
  
  
  private func authorLabelConstraints() {
    authorName.translatesAutoresizingMaskIntoConstraints = false
    authorName.topAnchor.constraint(equalTo: bookCover.bottomAnchor, constant: 16).isActive = true
    authorName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
    authorName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    
  }
  
  private func bookDescriptionConstraints() {
    bookDescription.translatesAutoresizingMaskIntoConstraints = false
    bookDescription.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: 16).isActive = true
    bookDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
    bookDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    bookDescription.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.35).isActive = true
  }
  
  private func amazonLaunchConstraints() {
    amazonLaunchButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
    amazonLaunchButton.leadingAnchor.constraint(equalTo: bookCover.trailingAnchor, constant: 5).isActive = true
    amazonLaunchButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 5).isActive = true
  }
}

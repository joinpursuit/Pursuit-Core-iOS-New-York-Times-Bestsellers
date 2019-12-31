//
//  DetailView.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
protocol DetailViewDelegate: AnyObject {
  func amazonPressed()
}
class DetailView: UIView {
  
  weak var delegate: DetailViewDelegate?
  
  
  lazy var amazonButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "amazon"), for: .normal)
    button.addTarget(self, action: #selector(amazonPressed), for: .touchUpInside)
    return button
  }()
  @objc func amazonPressed() {
    delegate?.amazonPressed()
  }
  lazy var image: UIImageView = {
    let image = UIImageView()
    return image
  }()
  lazy var label: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.font = UIFont(name: "Helvetica", size: 30.0)
    return label
  }()
  lazy var textView: UITextView = {
    let textView = UITextView()
    textView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    textView.font = UIFont(name:"Helvetica" , size:20.0)
    textView.isEditable = false
    
    return textView
  }()
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
    
  }
  private func commonInit(){
    self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    setUp()
  }
  private func setUp(){
    
    imageConstraints()
    labelConstraint()
    textViewConstraint()
    setupAmazonButton()
    
  }
  private func imageConstraints(){
    addSubview(image)
    image.translatesAutoresizingMaskIntoConstraints = false
    image.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
    image.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    image.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
    image.centerXAnchor.constraint(equalTo:safeAreaLayoutGuide.centerXAnchor).isActive = true
  }
  private func labelConstraint(){
    addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 8).isActive = true
    label.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: 30).isActive = true
    
  }
  
  private func textViewConstraint(){
    addSubview(textView)
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
    textView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
    textView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
    textView.centerXAnchor.constraint(equalTo:safeAreaLayoutGuide.centerXAnchor).isActive = true
    
  }
  private func setupAmazonButton() {
    addSubview(amazonButton)
    amazonButton.translatesAutoresizingMaskIntoConstraints = false
    amazonButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
    amazonButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
    amazonButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
    amazonButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
  }
  
}

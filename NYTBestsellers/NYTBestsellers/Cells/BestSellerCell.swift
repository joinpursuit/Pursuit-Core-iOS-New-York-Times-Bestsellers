//
//  BestSellerCell.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerCell: UICollectionViewCell {
  let bestSellerView = BestSellerView()
  lazy var image: UIImageView = {
    let image = UIImageView()
    let myImage = UIImage.init(named: "J5LVHEL")
    image.image = myImage
    return image
  }()
  lazy var label: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.font = UIFont(name: "Helvetica", size: 12.0)
    label.font = UIFont.boldSystemFont(ofSize: 16.0)
    return label
  }()
  lazy var textView: UITextView = {
    let textView = UITextView()
    textView.backgroundColor = .white
    textView.textAlignment = .center
    textView.isEditable = false
    textView.isSelectable = false
    return textView
  }()
  private var shadowLayer: CAShapeLayer!
  private var cornerRadius: CGFloat = 0.0
  private var fillColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    addSubview(image)
    addSubview(label)
    addSubview(textView)
    imageConstraints()
    labelConstraint()
    textViewConstraint()
    if shadowLayer == nil {
      shadowLayer = CAShapeLayer()
      
      shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
      shadowLayer.fillColor = fillColor.cgColor
      
      shadowLayer.shadowColor = UIColor.black.cgColor
      shadowLayer.shadowPath = shadowLayer.path
      shadowLayer.shadowOffset = CGSize(width: 1.0, height: 1.0)
      shadowLayer.shadowOpacity = 0.9
      shadowLayer.shadowRadius = 3
      
      layer.insertSublayer(shadowLayer, at: 0)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError("init(coder:) has not been implemented")
    
    
  }
  func congifureCell(for book: BookResults){
    label.text = "Best seller for \(book.weeksOnList) weeks"
    textView.text = book.bookDetails.first?.description
    APIClient.getGoogleImage(keyword: (book.bookDetails.first?.primaryIsbn13)!) { (result) in
      switch result{
      case .failure(let error):
        DispatchQueue.main.async {
          print(error)
        }
      case .success(let data):
        DispatchQueue.main.async {
          guard let imageData = data?.imageLinks.smallThumbnail else {
            return self.image.image = UIImage(named: "J5LVHEL")
          }
          self.image.getImage(with: imageData) { (result) in
            switch result{
            case .failure(let error):
              print(error)
            case .success(let image):
              DispatchQueue.main.async {
                self.image.image = image
              }
            }
          }
        }
        
      }
    }
  }
  private func imageConstraints(){
    image.translatesAutoresizingMaskIntoConstraints = false
    image.topAnchor.constraint(equalTo: topAnchor, constant: 11).isActive = true
    image.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    image.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
    image.centerXAnchor.constraint(equalTo:safeAreaLayoutGuide.centerXAnchor).isActive = true
  }
  private func labelConstraint(){
    label.translatesAutoresizingMaskIntoConstraints = false
    label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
    label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
    label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10).isActive = true
    
  }
  
  private func textViewConstraint(){
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8).isActive = true
    textView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
    textView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
    textView.centerXAnchor.constraint(equalTo:safeAreaLayoutGuide.centerXAnchor).isActive = true
    
  }
  
}

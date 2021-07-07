//
//  FavoiteBookCell.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

//Step 1 create a protocol
protocol FavoiteBookCellDelegate: AnyObject {
   func presentAlertController(alertController: UIAlertController)
}

class FavoiteBookCell: UICollectionViewCell {
    //create the weak var
    weak var delegate: FavoiteBookCellDelegate?
    lazy var favoriteImageObj: UIImageView = {
        let image = UIImageView.init(image: UIImage.init(named: "placeHolder"))
        return image
    }()
    lazy var deletebuttonObj: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.setTitle("Action", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = true
        //3 create target function
        button.addTarget(self, action: #selector(bttnPressed), for: .touchUpInside)
        
        return button
    }()
    lazy var favoriteBookTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Best Seller list label"
        label.textColor = .white
        label.backgroundColor = .gray
        return label
    }()
    lazy var favoriteDetailDescriptionObj: UITextView = {
        let textView = UITextView()
        textView.text = "This area will give a little description"
        textView.textColor = .white
        textView.backgroundColor = .gray
        textView.isSelectable = false
        textView.isEditable = false 
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        bttnPressed()
       
    }
    @objc func bttnPressed(){
        let alertController = UIAlertController(title: "More Options", message: "What would you like to do?", preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (delete) in
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let seeOnAmazon = UIAlertAction(title: "See on Amazon", style: .default) { (amazon) in
            print("amazon")
        }
        alertController.addAction(deleteAction)
        alertController.addAction(seeOnAmazon)
        alertController.addAction(cancelAction)
        // 4 call the delegate function from the protocol
        delegate?.presentAlertController(alertController: alertController)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit(){
        backgroundColor = .red
        layer.cornerRadius = 10
        setupViews()
    }
    private func setupViews(){
        setupImageView()
        setupButtonView()
        setupLabelView()
        setupTextView()
    }
   private func setupImageView(){
    addSubview(favoriteImageObj)
    favoriteImageObj.translatesAutoresizingMaskIntoConstraints = false
    favoriteImageObj.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
    favoriteImageObj.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
    favoriteImageObj.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80).isActive = true
    favoriteImageObj.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150).isActive = true

    }
    private func setupButtonView(){
        addSubview(deletebuttonObj)
        deletebuttonObj.translatesAutoresizingMaskIntoConstraints = false
        deletebuttonObj.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        deletebuttonObj.leadingAnchor.constraint(equalTo: favoriteImageObj.trailingAnchor, constant: 11).isActive = true
        deletebuttonObj.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        deletebuttonObj.heightAnchor.constraint(equalToConstant: 60).isActive = true
        deletebuttonObj.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    private func setupLabelView(){
        addSubview(favoriteBookTitleLabel)
        favoriteBookTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteBookTitleLabel.topAnchor.constraint(equalTo: favoriteImageObj.bottomAnchor, constant: 11).isActive = true
        favoriteBookTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        favoriteBookTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    }
    private func setupTextView() {
        addSubview(favoriteDetailDescriptionObj)
    favoriteDetailDescriptionObj.translatesAutoresizingMaskIntoConstraints = false
        favoriteDetailDescriptionObj.topAnchor.constraint(equalTo: favoriteBookTitleLabel.bottomAnchor, constant: 0).isActive = true
        favoriteDetailDescriptionObj.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        favoriteDetailDescriptionObj.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        favoriteDetailDescriptionObj.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
}

//
//  DetailBookView.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailBookView: UIView {
    lazy var detailImageViewObj: UIImageView = {
        let imageView = UIImageView.init(image: UIImage.init(named: "placeHolder"))

        return imageView
    }()
    lazy var detailTitleLabelObj: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        label.textColor = .white
        label.text = "This is for the title"
        return label
    }()
    lazy var detailDescriptionTextViewObj: UITextView = {
        let textView = UITextView()
        textView.text = "This area will give a little description"
        textView.textColor = .white
        textView.backgroundColor = .gray
        textView.isSelectable = false
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
        setupViews()
    }
    
    private func setupViews(){
        setupImageView()
        setupLabelView()
        setupTextView()
    }
    private func setupImageView() {
        addSubview(detailImageViewObj)
        detailImageViewObj.translatesAutoresizingMaskIntoConstraints = false
        detailImageViewObj.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        detailImageViewObj.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -200).isActive = true
    }
    private func setupLabelView(){
        addSubview(detailTitleLabelObj)
        detailTitleLabelObj.translatesAutoresizingMaskIntoConstraints = false
        detailTitleLabelObj.topAnchor.constraint(equalTo: detailImageViewObj.bottomAnchor, constant: 11).isActive = true
        detailTitleLabelObj.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        detailTitleLabelObj.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    }
    private func setupTextView(){
        addSubview(detailDescriptionTextViewObj)
        detailDescriptionTextViewObj.translatesAutoresizingMaskIntoConstraints = false
        detailDescriptionTextViewObj.topAnchor.constraint(equalTo: detailTitleLabelObj.bottomAnchor, constant: 11).isActive = true
        detailDescriptionTextViewObj.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        detailDescriptionTextViewObj.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        detailDescriptionTextViewObj.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -11).isActive = true
    }
    
}

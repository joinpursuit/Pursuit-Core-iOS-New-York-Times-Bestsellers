//
//  AmazonWebView.swift
//  NYTBestsellers
//
//  Created by Biron Su on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
import WebKit
class AmazonWebView: UIView {

    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        button.isOpaque = false
        return button
    }()
    lazy var newView: WKWebView = {
        let newView = WKWebView()
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.backgroundColor = .white
        return newView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        fatalError("init(coder:) failed to implement")
    }
    private func commonInit(){
        setUpConstraints()
    }
    func setUpConstraints() {
        addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        dismissButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        dismissButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor).isActive = true
        dismissButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor).isActive = true
        
        addSubview(newView)
        newView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        newView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        newView.heightAnchor.constraint(equalToConstant: 600).isActive = true
        newView.widthAnchor.constraint(equalToConstant: 400).isActive = true
    }
}

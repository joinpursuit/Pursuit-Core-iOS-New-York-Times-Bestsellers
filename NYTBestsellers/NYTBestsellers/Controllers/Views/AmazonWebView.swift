//
//  AmazonWebView.swift
//  NYTBestsellers
//
//  Created by Biron Su on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class AmazonWebView: UIView {

    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        backgroundColor = .red
        setUpConstraints()
    }

    func setUpConstraints() {
        func setupDismissButton() {
            addSubview(dismissButton)
            dismissButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            dismissButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            dismissButton.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
            dismissButton.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        }
    }
}

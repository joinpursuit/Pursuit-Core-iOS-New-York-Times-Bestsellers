//
//  AmazonLinkView.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
import WebKit

//used https://learnappmaking.com/wkwebview-how-to/ as reference

class AmazonLinkView: UIView {
    
    public lazy var webView: WKWebView = {
        let wv = WKWebView()
        wv.backgroundColor = .white
        return wv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        addSubview(webView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        webView.translatesAutoresizingMaskIntoConstraints = false
        [webView.centerYAnchor.constraint(equalTo: centerYAnchor),
            webView.centerXAnchor.constraint(equalTo: centerXAnchor),
            webView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1),
            webView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1)
            ].forEach{ $0.isActive = true }
    }

}

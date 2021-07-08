//
//  AmazonWebViewController.swift
//  NYTBestsellers
//
//  Created by Biron Su on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class AmazonWebViewController: UIViewController {
    var urlLink = String()
    let amazonWebView = AmazonWebView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(amazonWebView)
        amazonWebView.dismissButton.addTarget(self, action: #selector(dismissButton), for: .touchUpInside)
        let url = URL(string: urlLink)
        let request = URLRequest(url: url!)
        amazonWebView.newView.load(request)
    }
    @objc func dismissButton() {
        dismiss(animated: true, completion: nil)
    }
}

//
//  AmazonLinkViewController.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

//import UIKit
//import WebKit
//
//class AmazonLinkViewController: UIViewController, WKNavigationDelegate {
//    
//    var webView: WKWebView!
//    var amazonLink: String?
////    var amazonLinkView = AmazonLinkView()
//    
//    init(link: String) {
//        super.init(nibName: nil, bundle: nil)
//        self.amazonLink = link
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//
//    override func loadView() {
//        webView = WKWebView()
//        webView.navigationDelegate = self
//     //   amazonLinkView.webView.navigationDelegate = self
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let googleURL = URL(string: "https://www.google.com")!
//        let requestion = URLRequest(url: googleURL)
//        webView.load(requestion)
//        webView.allowsBackForwardNavigationGestures = true
////        if let amazonURL = amazonLink {
////            if let safeURL = URL(string: amazonURL) {
////               let urlToUse = URLRequest(url: safeURL)
////                    webView.load(urlToUse)
////            }
////        }
//        
//        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
//        toolbarItems = [refresh]
//        navigationController?.isToolbarHidden = false
//    }
//    
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        title = webView.title
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//}

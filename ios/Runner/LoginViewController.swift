//
//  LoginViewController.swift
//  Runner
//
//  Created by apultyna on 19/01/2019.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit

class LoginViewController : UIViewController, UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!
    var loggedInCallback : (() -> Void)? = nil
    var appKey: String = ""
    var token: String? = ""
    var login: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        let url = URL (string: "https://a2.wykop.pl/login/connect/appkey/" + appKey)
        NSLog("https://a2.wykop.pl/login/connect/appkey/" + appKey)
        let requestObj = URLRequest(url: url!)
        webView.loadRequest(requestObj)
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let url = request.url?.absoluteString;
        if (url != nil && url!.contains("ConnectSuccess")) {
            login = url?.components(separatedBy: "/token/").first?.components(separatedBy: "/login/")[1]
            token = url?.components(separatedBy: "/token/")[1].replacingOccurrences(of: "/", with: "")
            NSLog(login!)
            NSLog(token!)
            if (loggedInCallback != nil) {
                loggedInCallback!()
                loggedInCallback = nil
            }
            navigationController?.popViewController(animated: true)
            
            dismiss(animated: true, completion: nil)
            return false
        }
        return true;
    }
}


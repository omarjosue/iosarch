//
//  SecondViewController.swift
//  iOSarch
//
//  Created by Omar Josue on 10/16/15.
//  Copyright © 2015 SELEGNA Consulting. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    let defaultURL = NSURL(string: "http://www.selegnaconsulting.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadWebContent(defaultURL!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadWebContent(url: NSURL){
        let req = NSURLRequest(URL: url)
        webView.loadRequest(req)
    }

}


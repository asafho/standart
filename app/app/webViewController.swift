//
//  webViewController.swift
//  app
//
//  Created by Asaf Horovitz on 12/29/14.
//  Copyright (c) 2014 Asaf Horovitz. All rights reserved.
//

import UIKit
class webViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        adMob.displayInterstitial(self)
        super.viewDidLoad()
        adMob.loadBanners(self)
        general.sendFlurryEvent("open registration link")
        println("open link: "+general.contest.link)
        let url = NSURL(string: general.contest.link as String)
        let request = NSURLRequest(URL: url!)
        webView.scalesPageToFit = true
        webView.loadRequest(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doRefresh(AnyObject) {
        webView.reload()
    }
    
    @IBAction func goBack(AnyObject) {
        webView.goBack()
    }
    
    @IBAction func goForward(AnyObject) {
        webView.goForward()
    }

    func loadAd(){
        if(general.isConnectedToNetwork()){
            adMob.displayInterstitial(self)
        }
    }
}
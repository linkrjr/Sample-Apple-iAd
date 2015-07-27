//
//  ViewController.swift
//  Sample-Apple-iAd
//
//  Created by Ronaldo Gomes on 27/07/2015.
//  Copyright (c) 2015 Technophile. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController, ADBannerViewDelegate {

    @IBOutlet var adBanner:ADBannerView!
    @IBOutlet var timerMessage:UILabel!
    
    var timer:NSTimer?
    var secondsElapsed:Int = 0
    var pauseTimeCounting:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.adBanner.delegate = self
        self.adBanner.alpha = 0.0
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "showTimeMessage", userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showTimeMessage() {
        if !self.pauseTimeCounting {
            self.secondsElapsed++
            self.timerMessage.text = "You have been viewing this for \(self.secondsElapsed) seconds"
        } else {
            self.timerMessage.text = "Paused to show ad ..."
        }
    }
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        print("Ad Banner will load ad")
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.adBanner.alpha = 1.0
        })
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        print("Ad Banner did load ad")
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        print("Ad Banner action should begin")
        self.pauseTimeCounting = true
        return true
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        print("Ad Banner view action did finish")
        self.pauseTimeCounting = false
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        print("Ad Banner did failt to receive ad with error")
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.adBanner.alpha = 0.0
        })
        
    }
    
    
}


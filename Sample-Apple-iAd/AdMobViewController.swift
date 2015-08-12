//
//  AdMobViewController.swift
//  Sample-Apple-iAd
//
//  Created by Ronaldo GomesJr on 12/08/2015.
//  Copyright © 2015 Technophile. All rights reserved.
//

import UIKit
import GoogleMobileAds

class AdMobViewController: UIViewController, GADBannerViewDelegate, GADInterstitialDelegate {

    @IBOutlet var gadView:GADBannerView!
    
    var interstitial:GADInterstitial?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(GADRequest.version())
        self.gadView.adUnitID = "ca-app-pub-4739732814498144/5098194114"
        self.gadView.rootViewController = self
        self.gadView.delegate = self

        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        
        self.gadView.loadRequest(GADRequest())
        
        self.interstitial = createAndLoadInterstitialAd()
        
    }

    @IBAction func showInterstitialAdButtonTapped(sender: AnyObject) {

        print(self.interstitial!.isReady)
        if self.interstitial!.isReady {
            self.interstitial!.presentFromRootViewController(self)
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func adViewDidReceiveAd(bannerView: GADBannerView!) {
        print("displayed ad")
    }
    
    func adView(bannerView: GADBannerView!, didFailToReceiveAdWithError error: GADRequestError!) {
        print("failed to present ad")
    }
    
    func adViewWillPresentScreen(bannerView: GADBannerView!) {
        print("will presetn screen")
    }
    
    func adViewWillLeaveApplication(bannerView: GADBannerView!) {
        print("will leave app")
    }

    func interstitialDidDismissScreen(ad: GADInterstitial!) {
        self.interstitial = createAndLoadInterstitialAd()
    }
    
    private func createAndLoadInterstitialAd() -> GADInterstitial {
        let interstitialAd = GADInterstitial(adUnitID: "ca-app-pub-4739732814498144/9528393716")
        let request2 = GADRequest()
        request2.testDevices = [kGADSimulatorID]
        interstitialAd.loadRequest(request2)
        interstitialAd.delegate = self
        return interstitialAd
    }
    
}

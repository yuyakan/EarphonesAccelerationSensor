//
//  InterstitialAdView.swift
//  Earphones Acceleration Sensor
//
//  Created by 上別縄祐也 on 2022/02/03.
//

import GoogleMobileAds
import SwiftUI

final class InterstitialAdView: NSObject, UIViewControllerRepresentable, GADFullScreenContentDelegate {
    
    let interstitialAd = InterstitialAd.shared.interstitialAd
    @Binding var isPresented: Bool
    var adUnitId: String
    
    init(isPresented: Binding<Bool>, adUnitId: String) {
        self._isPresented = isPresented
        self.adUnitId = adUnitId
        super.init()
        
        interstitialAd?.fullScreenContentDelegate = self //Set this view as the delegate for the ad
    }
    
    //Make's a SwiftUI View from a UIViewController
    func makeUIViewController(context: Context) -> UIViewController {
        let view = UIViewController()
        
        //Show the ad after a slight delay to ensure the ad is loaded and ready to present
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1)) {
            self.showAd(from: view)
        }
        
        return view
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    //Presents the ad if it can, otherwise dismisses so the user's experience is not interrupted
    func showAd(from root: UIViewController) {
        
        if let ad = interstitialAd {
            ad.present(fromRootViewController: root)
        } else {
            print("Ad not ready")
            self.isPresented.toggle()
        }
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        //Prepares another ad for the next time view presented
        InterstitialAd.shared.loadAd(withAdUnitId: adUnitId)
        
        //Dismisses the view once ad dismissed
        isPresented.toggle()
    }
}

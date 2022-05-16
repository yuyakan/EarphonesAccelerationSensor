//
//  AdView.swift
//  Earphones Acceleration Sensor
//
//  Created by 上別縄祐也 on 2022/05/16.
//

import SwiftUI
import GoogleMobileAds

struct AdView: UIViewRepresentable {
    func makeUIView(context: Context) -> GADBannerView {
        let banner = GADBannerView(adSize: GADAdSizeBanner)
        let scenes = UIApplication.shared.connectedScenes
        let windowScenes = scenes.first as? UIWindowScene
        let rootVC = windowScenes?.keyWindow?.rootViewController
        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716"//テスト
        banner.rootViewController = rootVC
        banner.load(GADRequest())
        return banner
    }

    func updateUIView(_ uiView: GADBannerView, context: Context) {
    }
}

//
//  AirpodsAcceleratorApp.swift
//  AirpodsAccelerator
//
//  Created by 上別縄祐也 on 2021/11/11.
//

import SwiftUI
import AppTrackingTransparency
import UIKit
import GoogleMobileAds

// AppDelegateクラスを定義する
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Mobile Ads SDKを初期化する
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }
}


@main
struct AirpodsAcceleratorApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
        var body: some Scene {
            WindowGroup {
                MeasurementView()
            }
        }
}

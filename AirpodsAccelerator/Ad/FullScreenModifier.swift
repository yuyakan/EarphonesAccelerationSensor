//
//  FullScreenModifier.swift
//  Earphones Acceleration Sensor
//
//  Created by 上別縄祐也 on 2022/02/03.
//
import SwiftUI

struct FullScreenModifier<Parent: View>: View {
    @Binding var isPresented: Bool
    @State var adType: AdType
    
    //Select adType
    enum AdType {
        case interstitial
    }
    
    var adUnitId: String
  
    //The parent is the view that you are presenting over
    //Think of this as your presenting view controller
    var parent: Parent
    
    var body: some View {
        ZStack {
            parent
            
            if isPresented {
                EmptyView()
                    .edgesIgnoringSafeArea(.all)
                
                if adType == .interstitial {
                    InterstitialAdView(isPresented: $isPresented, adUnitId: adUnitId)
                }
            }
        }
        .onAppear {
            //Initialize the ads as soon as the view appears
            if adType == .interstitial {
                InterstitialAd.shared.loadAd(withAdUnitId: adUnitId)
            }
        }
    }
}

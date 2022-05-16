//
//  ViewExtension.swift
//  Earphones Acceleration Sensor
//
//  Created by 上別縄祐也 on 2022/02/03.
//

import SwiftUI

extension View {
    public func presentInterstitialAd(isPresented: Binding<Bool>, adUnitId: String) -> some View {
        FullScreenModifier(isPresented: isPresented, adType: .interstitial, adUnitId: adUnitId, parent: self)
    }
}

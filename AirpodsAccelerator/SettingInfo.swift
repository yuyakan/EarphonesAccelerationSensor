//
//  SettingViewController.swift
//  AirpodsAccelerator
//
//  Created by 上別縄祐也 on 2021/11/14.
//

import SwiftUI


public class SettingInfo : ObservableObject{
    static let shared = SettingInfo()
    private init(){}
    @Published var checkedSensor: [Bool] = [
        true,
        false,
        false,
        false
    ]
}


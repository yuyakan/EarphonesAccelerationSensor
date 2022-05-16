//
//  ChartController.swift
//  AirpodsAccelerator
//
//  Created by 上別縄祐也 on 2021/11/17.
//

import SwiftUI


class ChartController: ObservableObject{
    @ObservedObject var setting = SettingInfo.shared
    @ObservedObject var calc = ViewController()
    
    var select1: [Double] = []
    var select2: [Double] = []
    var select3: [Double] = []
    
    func charSellect(){
        if setting.checkedSensor[0]{
            select1 = calc.AccelX
            select2 = calc.AccelY
            select3 = calc.AccelZ
        }else if setting.checkedSensor[1]{
            select1 = calc.GravityX
            select2 = calc.GravityY
            select3 = calc.GravityZ
        }else if setting.checkedSensor[2]{
            select1 = calc.RotationX
            select2 = calc.RotationY
            select3 = calc.RotationZ
        }else if setting.checkedSensor[3]{
            select1 = calc.Roll
            select2 = calc.Pitch
            select3 = calc.Yaw
        }
    }
}

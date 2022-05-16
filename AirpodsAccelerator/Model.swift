//
//  Model.swift
//  Earphones Acceleration Sensor
//
//  Created by 上別縄祐也 on 2022/05/16.
//

import Foundation
import CoreMotion
import SwiftUI

protocol ModelInput{
    func initializeData()
    func getData(data: CMDeviceMotion) -> TimeInterval
}

final class Model: ModelInput {
    @ObservedObject var setting = SettingInfo.shared
    private var graph: [Double] = []
    
    private var time : [Double] = []
    private var nowTime: Double = 0.0
    
    private var X : [Double] = []
    private var Y : [Double] = []
    private var Z : [Double] = []
    private var Total: [Double] = []
    
    func initializeData() {
        graph = []
        nowTime = 0.0
        time.removeAll()
        X.removeAll()
        Y.removeAll()
        Z.removeAll()
    }
    
    func getData(data: CMDeviceMotion) -> TimeInterval {
        let x, y, z : Double
        
        if self.setting.checkedSensor[0] {
            x = data.userAcceleration.x
            y = data.userAcceleration.y
            z = data.userAcceleration.z
            graph.append(abs(x) + abs(y) + abs(z))
        }else if self.setting.checkedSensor[1] {
            x = data.gravity.x
            y = data.gravity.y
            z = data.gravity.z
            graph.append(z*z)
        }else if self.setting.checkedSensor[2] {
            x = data.rotationRate.x
            y = data.rotationRate.y
            z = data.rotationRate.z
            graph.append((abs(x) + abs(y) + abs(z)) * 0.3)
        }else {
            x = data.attitude.pitch
            y = data.attitude.roll
            z = data.attitude.yaw
            graph.append(y + 0.3)
        }
        
        let t = data.timestamp

        if (nowTime == 0.0){
            nowTime = t
        }
        time.append(t - nowTime)
        
        X.append(x)
        Y.append(y)
        Z.append(z)
        
        return t - nowTime
    }
}

//
//  ViewControllerUserAccel.swift
//  AirpodsAccelerator
//
//  Created by 上別縄祐也 on 2021/11/14.
//

//import UIKit
//import CoreMotion
//import SwiftUI
//
//class ViewControllerUserAccel: ViewController{
//
//    var AccelX : [Double] = []
//    var AccelY : [Double] = []
//    var AccelZ : [Double] = []
//    var AccelTotal : [Double] = []
//
//    override func getData(_ data: CMDeviceMotion) {
//
//        let x = data.userAcceleration.x
//        let y = data.userAcceleration.y
//        let z = data.userAcceleration.z
//        let t = data.timestamp
//
//        if (nowTime == 0.0){
//            nowTime = t
//        }
//        timeCounter = t - nowTime
//        time.append(t - nowTime)
//        AccelX.append(x)
//        AccelY.append(y)
//        AccelZ.append(z)
//        AccelTotal.append(sqrt(x * x + y * y + z * z))
//        print(data.gravity)
//    }
//
//    override func stopCalc(file: String){
//        super.stopCalc(file: file)
//
//        AccelX.removeAll()
//        AccelY.removeAll()
//        AccelZ.removeAll()
//        AccelTotal.removeAll()
//    }
//
//    override func createFile(fileName: String){
//        do {
//            let csv = zip(zip(zip(zip(time, AccelX)
//                                    .map { nums in "\(nums.0), \(nums.1)" }
//                                  , AccelY)
//                                .map { nums in "\(nums.0), \(nums.1)" }
//                              , AccelZ)
//                            .map { nums in "\(nums.0), \(nums.1)" }
//                          ,AccelTotal)
//                .map { nums in "\(nums.0), \(nums.1)" }
//                .joined(separator: "\n")
//            let csv2 = Title + csv
//
//            let path = NSHomeDirectory() + "/Documents/" + fileName + ".csv"
//            try csv2.write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
//            print("保存しました。")
//            showingAlert = true
//        }
//        catch {
//            print("保存に失敗しました。: \(error)")
//            showingAlert = false
//        }
//    }
//}

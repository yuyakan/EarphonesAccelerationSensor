//
//  ViewControllerGravity.swift
//  AirpodsAccelerator
//
//  Created by 上別縄祐也 on 2021/11/14.
//

//import UIKit
//import CoreMotion
//import SwiftUI
//
//class ViewControllerGravity: ViewController{
//    
//    var GravityX : [Double] = []
//    var GravityY : [Double] = []
//    var GravityZ : [Double] = []
//    var GravityTotal : [Double] = []
//    
//    override func getData(_ data: CMDeviceMotion) {
//        
//        let x = data.gravity.x
//        let y = data.gravity.y
//        let z = data.gravity.z
//        let t = data.timestamp
//        Title = "time, g_x, g_y, g_z, g\n"
//        
//        if (nowTime == 0.0){
//            nowTime = t
//        }
//        timeCounter = t - nowTime
//        time.append(t - nowTime)
//        GravityX.append(x)
//        GravityY.append(y)
//        GravityZ.append(z)
//        GravityTotal.append(sqrt(x * x + y * y + z * z))
//        print(data.gravity)
//    }
//    
//    override func stopCalc(file: String){
//        super.stopCalc(file: file)
//        
//        GravityX.removeAll()
//        GravityY.removeAll()
//        GravityZ.removeAll()
//        GravityTotal.removeAll()
//    }
//    
//    override func createFile(fileName: String){
//        do {
//            let csv = zip(zip(zip(zip(time, GravityX)
//                                    .map { nums in "\(nums.0), \(nums.1)" }
//                                  , GravityY)
//                                .map { nums in "\(nums.0), \(nums.1)" }
//                              , GravityZ)
//                            .map { nums in "\(nums.0), \(nums.1)" }
//                          ,GravityTotal)
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

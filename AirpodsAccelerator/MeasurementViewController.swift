//
//  ViewController.swift
//  AirpodsAccelerator
//
//  Created by 上別縄祐也 on 2021/11/14.
//

import UIKit
import CoreMotion
import SwiftUI
import AVFoundation
import GoogleMobileAds

class MeasurementViewController: UIViewController, CMHeadphoneMotionManagerDelegate, ObservableObject{
    @Published var Name = ""
    @Published var timeCounter = "0.00"
    @Published var showingAlert = false
    @Published var showingAlert3 = false
    @Published var start = false
    @Published var status = "Waiting for measurement"
    @Published var stopSave = false
    
    let Airpods = CMHeadphoneMotionManager()
    
    private var input: MeasurementPresenterInput!
    func inject(input: MeasurementPresenterInput) {
        self.input = input
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Airpods.delegate = self
    }

    override func viewWillAppear(_ flag: Bool){
        super.viewWillAppear(flag)
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    func startCalc(){
        showingAlert = false
        showingAlert3 = false
        if Name == "" {
            showingAlert3 = true
            return
        }
        start = true
        
        input.initializeData()
    
        Airpods.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: {[weak self] motion, error  in
            guard let motion = motion else { return }
            self?.getData(motion)
        })
        return
    }
    
    func getData(_ data: CMDeviceMotion){
        status = "During measurement"
        let t = input.getData(data: data)
        timeCounter = String(format: "%0.2f",t)
    }
 
    func stopCalc(){
        Airpods.stopDeviceMotionUpdates()
        if nowTime == 0.0 {
            return
        }
        showingAlert = false
    }
    
    func saveFile(){
        do {
            var csv = ""
            
            csv = self.createCsv(Data1: X, Data2: Y, Data3: Z)

            let path = NSHomeDirectory() + "/Documents/" + Name + ".csv"
            try csv.write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
            status = "End of measurement"
            print("Saved")
            showingAlert = true
            Name = ""
            print( graph)
        }
        catch {
            print("Failed to save: \(error)")
            showingAlert = false
        }
    }
    
    func createCsv(Data1: [Double], Data2: [Double], Data3: [Double]) -> String {
        //計測データを一つにまとめる
        var csv = zip(zip(zip(time, Data1)
                            .map { nums in "\(nums.0), \(nums.1)" }
                          , Data2)
                        .map { nums in "\(nums.0), \(nums.1)" }
                      , Data3)
                    .map { nums in "\(nums.0), \(nums.1)" }
                    .joined(separator: "\n")
        
        //Attitude以外の時はTotalを追加
        var Title: String
        if setting.checkedSensor[3] {
            Title = "time, pitch, roll, yaw\n"
        } else {
            Title = "time, x, y, z, T\n"
            Total = Data1.map{$0 * $0} + Data2.map{$0 * $0} + Data3.map{$0 * $0}
            Total = Total.map{sqrt($0)}
            csv = zip(csv, Total).map { nums in "\(nums.0), \(nums.1)" }
            .joined(separator: "\n")
        }
        
        csv = Title + csv
        return csv
    }
    
    func timer() -> String{
        return timeCounter
    }
}



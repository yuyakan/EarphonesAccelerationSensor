//
//  SettingView.swift
//  AirpodsAccelerator
//
//  Created by 上別縄祐也 on 2021/11/14.
//

import SwiftUI


struct SettingView: View {
    @ObservedObject var setting = SettingInfo.shared
    
    let sensorKind: [String] = [
        "userAcceleration",
        "gravity",
        "rotationRate",
        "attitude"
    ]

        var body: some View {
            List {
                ForEach(0..<sensorKind.count) { index in
                    HStack {
                        Image(systemName: setting.checkedSensor[index] ? "checkmark.circle.fill" : "circle")
                        Text("\(sensorKind[index])")
                        Spacer()
                    }

                    .contentShape(Rectangle())
                    .onTapGesture {
                        setting.checkedSensor = [Bool](repeating: false,count: sensorKind.count)
                        setting.checkedSensor[index].toggle()
                    }
                }
            }
        }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

//
//  MeasurementPresenter.swift
//  Earphones Acceleration Sensor
//
//  Created by 上別縄祐也 on 2022/05/16.
//

import Foundation
import CoreMotion

protocol MeasurementPresenterInput {
    func initializeData()
    func getData(data: CMDeviceMotion) -> TimeInterval
}

protocol MeasurementPresenterOutput {
    
}

final class MeasurementPresenter {
    private var model: ModelInput
    
    init(model: ModelInput){
        self.model = model
    }
}

extension MeasurementPresenter: MeasurementPresenterInput {
    
    func initializeData() {
        model.initializeData()
    }
    
    func getData(data: CMDeviceMotion) -> TimeInterval {
        return model.getData(data: data)
    }
}

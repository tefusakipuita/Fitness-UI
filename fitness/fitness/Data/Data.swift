//
//  Data.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct Data {
    
    static let HexagonOptions = [
        HexagonOption(id: 0, title: "Heart Rate", imageName: "bolt.heart.fill", unit: "bpm", currentValue: "120"),
        HexagonOption(id: 1, title: "Distance", imageName: "bolt", unit: "meter", currentValue: "290"),
        HexagonOption(id: 2, title: "Water Intake", imageName: "drop", unit: "millilitre", currentValue: "480"),
        HexagonOption(id: 3, title: "Temperature", imageName: "thermometer", unit: "degree", currentValue: "98.7")
    ]
    
    static let bpmData = [
        BPM(id: 0, value: 86, time: "2 pm"),
        BPM(id: 1, value: 91, time: "3 pm"),
        BPM(id: 2, value: 84, time: "4 pm"),
        BPM(id: 3, value: 124, time: "5 pm"),
        BPM(id: 4, value: 148, time: "6 pm"),
        BPM(id: 5, value: 116, time: "7 pm")
    ]
    
    static let heartRateMenus = [
        HeartRateMenu(id: 0, name: "Resting", currentValue: 80),
        HeartRateMenu(id: 1, name: "Gym", currentValue: 140)
    ]
}

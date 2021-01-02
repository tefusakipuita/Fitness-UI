//
//  BpmManager.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

class BpmManager: ObservableObject {
    
    @Published var graphs = Data.bpmData
    
    @Published var selected = -1
}

//
//  HexagonManager.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

class HexagonManager: ObservableObject {
    
    @Published var options = Data.HexagonOptions
    
    @Published var selected = 0
}

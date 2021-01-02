//
//  HeartManager.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

class HeartManager: ObservableObject {
    
    @Published var menus = Data.heartRateMenus
    
    @Published var selected = 0
}

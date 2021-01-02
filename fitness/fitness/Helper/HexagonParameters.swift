//
//  HexagonParameters.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct HexagonParameters {
    
    struct Segment {
        let xFactors: (CGFloat, CGFloat, CGFloat)
        let yFactors: (CGFloat, CGFloat, CGFloat)
    }
    
    static let points = [
        Segment(xFactors: (0.6, 0.4, 0.5),  // 1番上
                yFactors: (0.05, 0.05, 0)),
        Segment(xFactors: (0.08, 0, 0),  // 左上
                yFactors: (0.2, 0.35, 0.25)),
        Segment(xFactors: (0, 0.08, 0),  // 左下
                yFactors: (0.65, 0.8, 0.75)),
        Segment(xFactors: (0.4, 0.6, 0.5),  // 1番下
                yFactors: (0.95, 0.95, 1)),
        Segment(xFactors: (0.92, 1, 1),  // 右下
                yFactors: (0.8, 0.65, 0.75)),
        Segment(xFactors: (1, 0.92, 1),  // 右上
                yFactors: (0.35, 0.2, 0.25))
    ]
}

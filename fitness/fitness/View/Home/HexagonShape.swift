//
//  HexagonShape.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct HexagonShape: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        var path = Path()
        
        path.move(to: CGPoint(
                    x: width * HexagonParameters.points[0].xFactors.0,
                    y: height * HexagonParameters.points[0].yFactors.0))
        
        HexagonParameters.points.forEach {
            path.addLine(to: CGPoint(
                            x: width * $0.xFactors.0,
                            y: height * $0.yFactors.0))
            
            path.addQuadCurve(to: CGPoint(
                                x: width * $0.xFactors.1,
                                y: height * $0.yFactors.1),
                              control: CGPoint(
                                x: width * $0.xFactors.2,
                                y: height * $0.yFactors.2))
        }
        
        return path
    }
}

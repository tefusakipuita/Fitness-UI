//
//  TabWaveShape.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct TabWaveShape: Shape {
    func path(in rect: CGRect) -> Path {
        let height = rect.height
        let width = rect.width
        let minWidth = width / 2
        
        var path = Path()
        
        let point1 = CGPoint(x: 50, y: 7)
        let point2 = CGPoint(x: minWidth - 40, y: 5)
        let point3 = CGPoint(x: minWidth + 40, y: 5)
        let point4 = CGPoint(x: width - 50, y: 7)
        
        let cPoint2 = CGPoint(x: 100, y: 20)
        let cPoint3 = CGPoint(x: minWidth, y: -2)
        let cPoint4 = CGPoint(x: width - 100, y: 20)
        
        path.move(to: CGPoint(x: 0, y: 0))
        
        path.addLine(to: point1)
        path.addQuadCurve(to: point2, control: cPoint2)
        path.addQuadCurve(to: point3, control: cPoint3)
        path.addQuadCurve(to: point4, control: cPoint4)
        path.addLine(to: CGPoint(x: width, y: 0))
        
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        
        return path
    }
}

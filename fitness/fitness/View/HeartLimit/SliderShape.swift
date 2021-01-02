//
//  SliderShape.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/12/01.
//

import SwiftUI

struct SliderShape: Shape {
    
    // MARK: - Property
    
    @Binding var progress: CGFloat  // 0.1 ~ 1
    
    let maxCount: CGFloat  // スライダーが 100% の時の長方形の数
    
    
    // MARK: - Main
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        let spaceHeight: CGFloat = 8  // 長方形の間のスペース
        let progressHeight = height * (1 - progress)
        let allSpaceHeight = spaceHeight * (maxCount - 1)  // すべてのスペースを合計した高さ
        let rectangleHeight = (height - allSpaceHeight) / maxCount  // 長方形の高さ (全体の高さからすべてのスペースを引いて、長方形の数で割る)
        let progressRectangleCount = progress * maxCount  // スライダーで使う長方形の数
        
        // MARK: - Path
        var path = Path()
        
        // スタート
        path.move(to: CGPoint(x: 0, y: progressHeight))
        
        var y = progressHeight //　初期設定(1番上)
        
        // progressStep の数だけ長方形を作成する
        for _ in stride(from: 0, to: progressRectangleCount, by: 1) {
            path.addRect(CGRect(x: 0, y: y, width: width, height: rectangleHeight))
            
            // 次の長方形の開始地点を更新しておく
            y += (rectangleHeight + spaceHeight)  // stepHeight(長方形の高さ) + gap(長方形間のスペース)
        }
        
        return path
    }
}

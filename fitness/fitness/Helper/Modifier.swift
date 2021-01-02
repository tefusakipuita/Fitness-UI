//
//  Modifier.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI


struct NeumorphicRectangle: ViewModifier {
    
    // MARK: - Property
    
    let topBlur: CGFloat
    let bottomBlur: CGFloat
    
    let cornerRadius: CGFloat
    
    let topOffset: CGFloat
    let bottomOffset: CGFloat
    
    
    // MARK: - Main
    
    func body(content: Content) -> some View {
        content
            
            // MARK: - ボタンの内側の左上のシャドー
            
            // 1. overlayで、太さが2のstrokeを上に重ねる
            // 2. ブラーをかけてシャドーぽくする
            // 3. offsetで右下にズラす
            // 4. 同じRoundedRectangleで切り取ることで、左上の部分のみが影のように残る
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.black, lineWidth: 2)
                    .blur(radius: topBlur)
                    .offset(x: topOffset, y: topOffset)  // 右下に移動
                    .mask(
                        RoundedRectangle(cornerRadius: cornerRadius)
                    )
            )
            
            // MARK: - ボタンの内側の右下のシャドー
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.whiteClearWithStopLinear, lineWidth: 2)
                    .blur(radius: bottomBlur)
                    .offset(x: bottomOffset, y: bottomOffset)  // 左上に移動
                    .mask(
                        RoundedRectangle(cornerRadius: cornerRadius)
                    )
            )
    }
}

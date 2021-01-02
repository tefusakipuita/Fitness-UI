//
//  BackButtonView.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct BackButtonView: View {
    
    // MARK: - Property
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.graphUnselected)
                .shadow(color: Color.white.opacity(0.15), radius: 6, x: -3, y: -3)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 5, y: 5)
                
            Circle()
                .fill(Color.textCirclePrimary)
                .frame(width: 5, height: 5)
                .offset(x: -10)
            
            Circle()
                .fill(Color.textCirclePrimary)
                .frame(width: 5, height: 5)
                .offset(x: -10)
                .rotationEffect(Angle(degrees: 120))
            
            Circle()
                .fill(Color.textCirclePrimary)
                .frame(width: 5, height: 5)
                .offset(x: -10)
                .rotationEffect(Angle(degrees: 240))
        } //: ZStack
        .frame(width: 44, height: 60)
    }
}

// MARK: - Preview

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HeartLimitView()
    }
}

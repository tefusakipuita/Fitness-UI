//
//  TabBarView.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct TabBarView: View {
    
    // MARK: - Property
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - 上側の波線
            TabWaveShape()
                .fill(Color.topBackground)
                .frame(height: 100)
            
            // MARK: - 左のサークル
            Circle()
                .fill(Color.hexagonLinear)
                .frame(width: 240, height: 240)
                .offset(x: -190, y: 60)
                .clipShape(
                    Rectangle()
                        .rotation(Angle(degrees: 8))
                        .offset(x: -150, y: 80)
                )
                .frame(height: 100)
                .opacity(0.3)
            
            // MARK: - 右のサークル
            Circle()
                .fill(Color.hexagonLinearInverted)
                .frame(width: 240, height: 240)
                .offset(x: 190, y: 60)
                .clipShape(
                    Rectangle()
                        .rotation(Angle(degrees: -8))
                        .offset(x: 150, y: 80)
                )
                .frame(height: 100)
                .opacity(0.3)
            
            // MARK: - Bottom Buttons
            HStack {
                Image(systemName: "eyedropper.halffull")
                Spacer()
                Image(systemName: "books.vertical.fill")
                Spacer()
                Image(systemName: "applelogo")
            } //: HStack
            .font(.system(size: 24))
            .foregroundColor(.circle)
            .padding(.horizontal, 30)
            
        } //: ZStack
        
    }
}

// MARK: - Preview

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



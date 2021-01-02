//
//  ForPointView.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct FourPointView: View {
    
    // MARK: - Property
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.clear)
                .neumorphicEffect(bottomOffset: -0.3)
            
            HStack (spacing: 14) {
                VStack (spacing: 14) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 5, height: 5)
                    Circle()
                        .fill(Color.white)
                        .frame(width: 5, height: 5)
                } //: VStack
                
                VStack (spacing: 14) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 5, height: 5)
                    Circle()
                        .fill(Color.white)
                        .frame(width: 5, height: 5)
                } //: VStack
            } //: HStack
        } //: ZStack
        .frame(width: 60, height: 60)
    }
}

// MARK: - Preview

struct ForPointView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

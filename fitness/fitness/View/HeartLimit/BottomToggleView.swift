//
//  BottomToggleView.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct BottomToggleView: View {
    
    // MARK: - Property
    
    @State var notification = true
    
    
    // MARK: - Body
    
    var body: some View {
        HStack (spacing: 14) {
            
            // MARK: - Toggle
            ZStack {
                RoundedRectangle(cornerRadius: 22)
                    .fill(Color.clear)
                    .neumorphicEffect(bottomBlur: 3, cornerRadius: 22, bottomOffset: -0.5)
                
                ZStack {
                    Circle()
                        .fill(notification ? Color.selectedLinear : Color.defaultToggleLinear)
                        .frame(width: 32, height: 32)
                    
                    VStack (spacing: 5) {
                        Rectangle()
                            .fill(Color.bottomBackground)
                            .frame(width: 13, height: 1.5)
                        Rectangle()
                            .fill(Color.bottomBackground)
                            .frame(width: 13, height: 1.5)
                    } //: VStack
                    
                } //: ZStack
                .rotationEffect(Angle(degrees: notification ? 180 : 0))
                .offset(x: notification ? 18 : -18)
                
            } //: ZStack
            .frame(width: 80, height: 44)
            
            Text("Notification")
                .font(.system(size: 14))
                .foregroundColor(.textCircleSecendary)
        } //: HStack
        .onTapGesture(perform: {
            withAnimation(.easeOut) {
                notification.toggle()
            }
            
        })
    }
}

// MARK: - Preview

struct BottomToggleView_Previews: PreviewProvider {
    static var previews: some View {
        HeartLimitView()
    }
}

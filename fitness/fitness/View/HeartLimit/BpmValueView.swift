//
//  BpmValueView.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct BpmValueView: View {
    
    // MARK: - Property
    
    @EnvironmentObject var heartManager: HeartManager
    
    @Namespace var animation
    
    
    // MARK: - Body
    
    var body: some View {
        VStack (alignment: .leading) {
            
            // MARK: - Rectangle Value
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.clear)
                    .neumorphicEffect(topBlur: 5, bottomBlur: 7, cornerRadius: 25)
                
                VStack {
                    Text("\(heartManager.menus[heartManager.selected].currentValue)")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.textCirclePrimary)
                        .animation(nil)
                    Text("bpm")
                        .foregroundColor(.textCircleSecendary)
                } //: VStack
            } //: ZStack
            .frame(width: 170, height: 170)
            
            // MARK: - Bottom Menu
            HStack {
                ForEach(heartManager.menus) { menu in
                    BpmMenu(menu: menu, animation: animation)
                    
                    if menu.id == 0 {
                        Spacer(minLength: 0)
                    }
                }
            } //: HStack
            .padding(.horizontal, 16)
            .padding(.top, 4)
            .frame(width: 170)
            
        } //: VStack
    }
}

// MARK: - Preview

struct BpmValueView_Previews: PreviewProvider {
    static var previews: some View {
        HeartLimitView()
    }
}

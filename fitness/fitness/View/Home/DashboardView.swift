//
//  DashboardView.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct DashboardView: View {
    
    // MARK: - Property
    
    @EnvironmentObject var manager: HexagonManager
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - 六角形
            HexagonShape()
                .fill(Color.hexagonLinear)
                .frame(height: UIScreen.main.bounds.width - 20)
            
            // MARK: - 中央のサークル
            Circle()
                .fill(Color.circle)
                .frame(width: 180, height: 180)
                .shadow(color: Color.white.opacity(0.15), radius: 20, x: -10, y: -10)
                .shadow(color: Color.black.opacity(0.4), radius: 20, x: 10, y: 10)
            
            // MARK: - 中央のテキスト
            VStack {
                Text(manager.options[manager.selected].currentValue)
                    .foregroundColor(.textCirclePrimary)
                    .font(.system(size: 50))
                
                Text(manager.options[manager.selected].unit)
                    .foregroundColor(.textCircleSecendary)
            } //: VStack
            
            // MARK: - 4つのボタン
            HStack (spacing: 145) {
                VStack (spacing: 145) {
                    OptionButton(option: manager.options[0])
                    OptionButton(option: manager.options[1])
                } //: VStack
                
                VStack (spacing: 145) {
                    OptionButton(option: manager.options[2])
                    OptionButton(option: manager.options[3])
                } //: VStack
            } //: HStack
            
            // MARK: - 左右の表記
            HStack {
                Image(systemName: "ellipsis")
                    .rotationEffect(Angle(degrees: -90))
                    .padding(.leading, 16)
                
                Spacer()
                
                Text("Analyse")
                    .rotationEffect(Angle(degrees: -90))
                    .padding(.trailing, 4)
            } //: HStack
            .foregroundColor(.unselectedBackground)
            
        } //: ZStack
    }
}

// MARK: - Preview

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

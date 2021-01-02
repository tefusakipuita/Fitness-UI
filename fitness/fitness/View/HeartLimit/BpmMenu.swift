//
//  BpmMenu.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct BpmMenu: View {
    
    // MARK: - Property
    
    var menu: HeartRateMenu
    @EnvironmentObject var heartManager: HeartManager
    
    var animation: Namespace.ID
    
    
    // MARK: - Body
    
    var body: some View {
        
        ZStack (alignment: .bottom) {
            Text(menu.name)
                .font(.system(size: 20))
                .foregroundColor(heartManager.selected == menu.id ? .textCirclePrimary : .textCircleSecendary)
            
            if heartManager.selected == menu.id {
                Rectangle()
                    .fill(Color.selectedLinear)
                    .frame(width: heartManager.selected == 0 ? 68 : 44, height: 2.5)
                    .offset(y: 7)
                    .matchedGeometryEffect(id: "bottomBar", in: animation)
            }
        }
        .onTapGesture(perform: {
            withAnimation(.spring()) {
                heartManager.selected = menu.id
            }
        })
    }
}

// MARK: - Preview

struct BpmMenu_Previews: PreviewProvider {
    static var previews: some View {
        HeartLimitView()
    }
}

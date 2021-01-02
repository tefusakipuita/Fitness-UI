//
//  OptionButton.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct OptionButton: View {
    
    // MARK: - Property
    
    @EnvironmentObject var hexagonManager: HexagonManager
    
    var option: HexagonOption
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    hexagonManager.selected == option.id ? Color.selectedLinear : Color.defaultOptionLinear
                )
                .frame(width: 30, height: 30)
                .mask(
                    Image(systemName: hexagonManager.options[option.id].imageName)
                        .font(.system(size: 30))
                        .frame(width: 30, height: 30)
                )
        } //: ZStack
        .onTapGesture(perform: {
            hexagonManager.selected = option.id
        })
    }
}

// MARK: - Preview

struct OptionButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

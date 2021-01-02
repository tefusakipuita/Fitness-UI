//
//  HeartLimitView.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct HeartLimitView: View {
    
    // MARK: - Property
    
    @EnvironmentObject var heartManager: HeartManager
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            Color.heartRateBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                // MARK: - Top Bar
                TopBarView()
                    .padding(.top, 50)
                
                HStack {
                    VStack (alignment: .leading) {
                        
                        // MARK: - Title
                        TitleView()
                        
                        // MARK: - Bpm Value
                        BpmValueView()
                            .padding(.top, 30)
                        
                        Spacer()
                        
                        // MARK: - Bottom Toggle
                        BottomToggleView()
                            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                        
                    } //: VStack
                    .padding(.leading, 32)
                    
                    Spacer()
                        
                    // MARK: - Rectangle Slider
                    RectangleSliderView(bpm: $heartManager.menus[heartManager.selected].currentValue)
                        .frame(width: 110)
                    
                } //: HStack
                .padding(.top, 50)
                
                Spacer()
            } //: VStack
            .edgesIgnoringSafeArea(.bottom)
            
        } //: ZStack
        
    }
}

// MARK: - Preview

struct HeartLimitView_Previews: PreviewProvider {
    static var previews: some View {
        HeartLimitView()
    }
}

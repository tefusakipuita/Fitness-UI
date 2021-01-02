//
//  ContentView.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Property
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            Color.backgroundLinear
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                // MARK: - Top Navigation Bar
                TopNavigationBar()
                
                // MARK: - Dashboard View
                DashboardView()
                    .padding(.horizontal, 32)
                    .padding(.top, -30)
                
                // MARK: - Graph Bar View
                GraphBarView()
                    .padding(.horizontal, 32)
                    .padding(.top, 20)
                
                Spacer(minLength: 0)
                
                // MARK: - Tab Bar View
                TabBarView()
            } //: VStack
            .edgesIgnoringSafeArea(.bottom)
            // EnvironmentObject を使う際、１番の大元に下の記述をする
            .environmentObject(HexagonManager())
             
        } //: ZStack
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

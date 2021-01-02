//
//  TopNavigationBar.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct TopNavigationBar: View {
    
    // MARK: - Property
    
    @EnvironmentObject var manager: HexagonManager
    
    @State var showSheet = false
    
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 6) {
                Image(systemName: "rectangle.leftthird.inset.fill")
                    .resizable()
                    .frame(width: 30, height: 10)
                
                Text(manager.options[manager.selected].title)
            } //: VStack
            
            Spacer()
            
            Button(action: {
                showSheet = true
            }, label: {
                FourPointView()
            })
        } //: HStack
        .foregroundColor(.textCircleSecendary)
        .padding()
        .padding(.horizontal)
//        .sheet(isPresented: $showSheet, content: {
//            HeartLimitView()
//        })
        // sheet じゃなくて fullScreenCover を使うことでfullscreenにできる
        .fullScreenCover(isPresented: $showSheet, content: {
            HeartLimitView()
                // ※ モーダル遷移の場合、モーダル遷移の箇所で environmentObject を記述する
                .environmentObject(HeartManager())
        })
    }
}

// MARK: - Preview

struct TopNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

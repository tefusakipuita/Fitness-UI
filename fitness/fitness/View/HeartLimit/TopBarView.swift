//
//  InfoView.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct TopBarView: View {
    
    // MARK: - Property
    
    @Environment(\.presentationMode) var presentation
    
    
    // MARK: - Body
    
    var body: some View {
        HStack (spacing: 14) {
            Button(action: {
                presentation.wrappedValue.dismiss()
            }, label: {
                BackButtonView()
            })
            
            VStack {
                Text("Back to")
                    .foregroundColor(.textCircleSecendary)
                Text("settngs")
                    .foregroundColor(.textCirclePrimary)
            } //: VStack
            
            Spacer()
            
            ZStack {
                Circle()
                    .fill(Color.hexagonLinearInverted)
                    .frame(width: 54, height: 54)
                
                Text("i")
                    .foregroundColor(.textCirclePrimary)
                    .font(.system(size: 28, weight: .semibold))
            } //: ZStack
        } //: HStack
        .padding()
        .padding(.horizontal)
    }
}

// MARK: - Preview

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        HeartLimitView()
    }
}

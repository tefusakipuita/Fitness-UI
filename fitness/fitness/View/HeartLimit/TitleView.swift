//
//  ControlView.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct TitleView: View {
    
    // MARK: - Property
    
    
    // MARK: - Body
    
    var body: some View {
        VStack (alignment: .leading) {
            Group {
                Text("Heart")
                Text("Limit")
            }
            .font(.system(size: 50, weight: .bold))
            .foregroundColor(.textCirclePrimary)
            
            Group {
                Text("Set a heart rate limit")
                Text("for timely control")
            }
            .foregroundColor(.textCircleSecendary)
        } //: VStack
    }
}

// MARK: - Preview

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        HeartLimitView()
    }
}

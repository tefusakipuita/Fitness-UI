//
//  GraphBarView.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct GraphBarView: View {
    
    // MARK: - Property
    
    @ObservedObject var graphManager = BpmManager()
    
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            
            // MARK: - Title
            HStack (spacing: 12) {
                Image(systemName: "calendar.badge.clock")
                Text("Avarage")
                
                Spacer()
            } //: HStack
            .foregroundColor(.textCircleSecendary)
            .font(.system(size: 22, weight: .semibold))
            
            // MARK: - Bar Graph
            HStack (spacing: 14) {
                ForEach(graphManager.graphs) { data in
                    GraphCell(graphManager: graphManager, bpm: data)
                } //: ForEach
                
                HStack {
                    Text("Average bpm:".uppercased())
                        .foregroundColor(.textCircleSecendary)
                    Text("Hours")
                        .foregroundColor(.textCirclePrimary)
                } //: HStack
                .font(.system(size: 14))
                .fixedSize()
                .frame(width: 24, height: 200)
                .rotationEffect(Angle(degrees: -90))
            } //: HStack
        } //: VStack
    }
    
}

// MARK: - Preview

struct GraphBarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

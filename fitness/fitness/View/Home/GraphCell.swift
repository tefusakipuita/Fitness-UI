//
//  GraphCell.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct GraphCell: View {
    
    // MARK: - Property
    
    @ObservedObject var graphManager: BpmManager
    
    var bpm: BPM
    
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(("\(Int(bpm.value))"))
                .foregroundColor(.textCircleSecendary)
                .font(.system(size: 16))
            
            RoundedRectangle(cornerRadius: 10)
                .fill(graphManager.selected == bpm.id ? Color.selectedLinear : Color.defaultGraphLinear)
                .frame(height: getRelativeHeight(value: bpm.value))
            
            Text(bpm.time)
                .foregroundColor(.unselectedBackground)
                .font(.system(size: 14))
        } //: VStack
        .frame(width: 40, height: 210)
        .onTapGesture(perform: {
            withAnimation {
                graphManager.selected = bpm.id
            }
        })
    }
    
    
    // MARK: - Function
    
    // 最大値から相対的な高さを算出するためのメソッド
    // ※ データの最大値がどれだけ大きくなってもグラフがはみ出たりしないようにできる
    func getRelativeHeight(value: CGFloat) -> CGFloat {
        // データの最大値に指定する高さ (データの最大値がいくらであっても高さは150にする)
        let availableHeight: CGFloat = 140
        // すべてのデータからmapで value のみを取り出し、最大値を取得する
        let maxValue = Data.bpmData.map({ $0.value }).max()
        
        let rHeight: CGFloat = (value / maxValue!) * availableHeight
        
        return rHeight
    }
}

// MARK: - Preview

struct GraphCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

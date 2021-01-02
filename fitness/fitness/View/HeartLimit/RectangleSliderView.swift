//
//  RectangleSliderView.swift
//  fitness
//
//  Created by 中筋淳朗 on 2020/11/30.
//

import SwiftUI

struct RectangleSliderView: View {
    
    // MARK: - Property
    
    @EnvironmentObject var heartManager: HeartManager
    
    @State var progress: CGFloat = -0.1 // 初期値は適当 (0.1 ~ 1)
    
    let minProgress: CGFloat = 0.1  // 最小値
    let maxProgress: CGFloat = 1  // 最大値
    
    let maxCount: CGFloat = 20  // 長方形の最大数
    
    @Binding var bpm: Int  // スライダーで管理する bpm数
    
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                
                // MARK: - Custom Slider
                SliderShape(progress: $progress, maxCount: maxCount)
                    .fill(Color.whiteToDarkGrayLinear)
                    .gesture(
                        DragGesture(minimumDistance: 5)
                            .onChanged({ value in
                                // ドラッグに合わせて新しいprogressを用意する (1番上なら１, 1番下なら0)
                                let nextProgress = 1 - (value.location.y / geometry.size.height)
                                
                                updateBPM(nextProgress: nextProgress)
                            })
                    ) //: gesture
                    .onAppear(perform: {
                        initializeProgress()
                    })
                    .onChange(of: heartManager.selected, perform: { value in
                        toggleProgress()
                    })
                
                // MARK: - 1番上の長方形のみに表示させる２本線
                VStack (spacing: 5) {
                    Rectangle()
                        .fill(Color.bottomBackground)
                        .frame(width: 18, height: 1.5)
                    Rectangle()
                        .fill(Color.bottomBackground)
                        .frame(width: 18, height: 1.5)
                } //: VStack
                .offset(y: calculateThumbPosition(height: geometry.size.height))
                
                // MARK: - Min
                Group {
                    Rectangle()
                        .fill(Color.selectedLinear)
                        .frame(width: 2, height: 36)
                        .offset(x: -geometry.size.width / 2 - 2, y: 275)
                    
                    Rectangle()
                        .fill(Color.selectedLinear)
                        .frame(width: 30, height: 25)
                        .rotationEffect(Angle(degrees: 90))
                        .mask(
                            Text("Min")
                                .font(.system(size: 14))
                        )
                        .rotationEffect(Angle(degrees: -90))
                        .fixedSize()
                        .offset(x: -geometry.size.width / 2 - 16, y: 275)
                } //: Group
                
                // MARK: - Max
                Group {
                    Rectangle()
                        .fill(Color.selectedLinear)
                        .frame(width: 2, height: 36)
                        .offset(x: -geometry.size.width / 2 - 2, y: -300)
                    
                    Rectangle()
                        .fill(Color.selectedLinear)
                        .frame(width: 30, height: 25)
                        .rotationEffect(Angle(degrees: 90))
                        .mask(
                            Text("Max")
                                .font(.system(size: 14))
                        )
                        .rotationEffect(Angle(degrees: -90))
                        .fixedSize()
                        .offset(x: -geometry.size.width / 2 - 16, y: -300)
                } //: Group
                
            } //: ZStack
        }) //: GeometryReader
    }
    
    
    // MARK: - Function
    
    // 最初にmanagerのbpmの値から progress の値を更新
    func initializeProgress() {
        progress = CGFloat(bpm) / 250
    }
    
    func toggleProgress() {
        progress = CGFloat(heartManager.menus[heartManager.selected].currentValue) / 250
    }
    
    // ドラッグに合わせて用意した nextProgress が最小値から最大値の間に存在するなら bpm を更新する
    // 最小値・最大値の外にドラッグした場合は更新しない (何も変更しない)
    func updateBPM(nextProgress: CGFloat) {
        if (nextProgress >= minProgress && nextProgress <= maxProgress) {
            // round で四捨五入することで長方形が上に積み重なっていくように見える (四捨五入しないと上に持ち上げるようなアニメーションになってしまう)
            // (2.3.4...19.20) / 20  ->  0.1, 0.15, 0.2, 0.25 ... 0.95,  1
            progress = round(nextProgress * maxCount) / maxCount
            bpm = Int(progress * 250) // bpm を整数にして更新する
        }
    }
    
    func calculateThumbPosition(height: CGFloat) -> CGFloat {
        let progressFromMiddle = 0.5 - progress
        
        let position = (progressFromMiddle * height) + 12
        
        return position
    }
}

// MARK: - Preview

struct RectangleSliderView_Previews: PreviewProvider {
    static var previews: some View {
        HeartLimitView()
    }
}


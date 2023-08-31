//
//  GaugeView.swift
//  FTHub
//
//  Created by Kaloyan Petkov on 29.08.23.
//

import SwiftUI

@available(iOS 15.0, *)
struct GaugeView: View {
    
    @Binding var percentage: Double
    
    let backgroundArcGradient: LinearGradient = LinearGradient(colors: [.gray], startPoint: .leading, endPoint: .trailing)
    
    let activeArcGradient: LinearGradient = LinearGradient(gradient: Gradient(colors: [.accentColor, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    let arrowGradient: LinearGradient = LinearGradient(gradient: Gradient(colors: [.accentColor, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    let lineWidth: CGFloat = 25
    let rounded: Bool = true
    
    let majorTickLength: CGFloat = 20
    let majorTickCount: Int = 9
    let majorTickColor: Color = .gray
    
    let arrowLength: CGFloat = 120
    let arrowAnchorMainCircleDiameter: CGFloat = 35
    let arrowAnchorMainCircleGradient: LinearGradient = LinearGradient(colors: [.gray], startPoint: .leading, endPoint: .trailing)
    let arrowAnchorSecondaryCircleDiameter: CGFloat = 10
    let arrowAnchorSecondaryCircleGradient: LinearGradient = LinearGradient(colors: [.white], startPoint: .leading, endPoint: .trailing)
    let arrowCornerRadius: CGFloat = 5
    
    var body: some View {
        VStack {
            ZStack() {

                GaugeBackgroundArcShape()
                    .stroke(backgroundArcGradient, style: StrokeStyle(lineWidth: lineWidth, lineCap: rounded ? .round : .square, lineJoin: rounded ? .round : .miter))
                
                GaugeActiveArcShape(percentage: self.percentage)
                    .stroke(activeArcGradient, style: StrokeStyle(lineWidth: lineWidth, lineCap: rounded ? .round : .square, lineJoin: rounded ? .round : .miter))
                    .rotationEffect(.degrees(45))
                    .animation(.bouncy, value: percentage)
                

                GaugeTicksShape(numberOfMajorTicks: majorTickCount - 1, majorTickLength: majorTickLength)
                    .stroke(majorTickColor, lineWidth: 3)
                    .frame(width: 350, height: 350)
                    .rotationEffect(.degrees(-105))

                ZStack {
                    GaugeArrowShape(anchorDiameter: arrowAnchorMainCircleDiameter, arrowLength: self.arrowLength, cornerRadius: self.arrowCornerRadius)
                        .fill(arrowGradient)
                        .rotationEffect(.degrees(-110))
                        .rotationEffect(.degrees(percentage * 220))
                    
                    GaugeCenterCircleView(arrowAnchorMainCircleDiameter: self.arrowAnchorMainCircleDiameter, arrowAnchorSecondaryCircleDiameter: self.arrowAnchorSecondaryCircleDiameter, arrowAnchorMainCircleGradient: self.arrowAnchorMainCircleGradient, arrowAnchorSecondaryCircleGradient: self.arrowAnchorSecondaryCircleGradient)
                }
                .offset(y: 30)

                
                
            }
            .frame(width: 350, height: 350)
        }
    }
}

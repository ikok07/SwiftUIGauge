//
//  GaugeView.swift
//  FTHub
//
//  Created by Kaloyan Petkov on 29.08.23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct GaugeView: View {
    
    @Binding public var percentage: Double
    
    public let backgroundArcGradient: LinearGradient = LinearGradient(colors: [.gray], startPoint: .leading, endPoint: .trailing)
    
    public let activeArcGradient: LinearGradient = LinearGradient(gradient: Gradient(colors: [.accentColor, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    public let arrowGradient: LinearGradient = LinearGradient(gradient: Gradient(colors: [.accentColor, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    public let lineWidth: CGFloat = 25
    public let rounded: Bool = true
    
    public let majorTickLength: CGFloat = 20
    public let majorTickCount: Int = 9
    public let majorTickColor: Color = .gray
    
    public let arrowLength: CGFloat = 120
    public let arrowAnchorMainCircleDiameter: CGFloat = 35
    public let arrowAnchorMainCircleGradient: LinearGradient = LinearGradient(colors: [.gray], startPoint: .leading, endPoint: .trailing)
    public let arrowAnchorSecondaryCircleDiameter: CGFloat = 10
    public let arrowAnchorSecondaryCircleGradient: LinearGradient = LinearGradient(colors: [.white], startPoint: .leading, endPoint: .trailing)
    public let arrowCornerRadius: CGFloat = 5
    
    public init(percentage: Binding<Double>) {
        self._percentage = percentage
    }
    
    public var body: some View {
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

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
    
    public let backgroundArcGradient: LinearGradient
    
    public let activeArcGradient: LinearGradient
    
    public let arrowGradient: LinearGradient
    
    public let lineWidth: CGFloat
    public let rounded: Bool
    
    public let majorTickLength: CGFloat
    public let majorTickCount: Int
    public let majorTickColor: Color
    
    public let arrowLength: CGFloat
    public let arrowAnchorMainCircleDiameter: CGFloat
    public let arrowAnchorMainCircleGradient: LinearGradient
    public let arrowAnchorSecondaryCircleDiameter: CGFloat
    public let arrowAnchorSecondaryCircleGradient: LinearGradient
    public let arrowCornerRadius: CGFloat
    
    public init(percentage: Binding<Double>) {
        self._percentage = percentage
        self.backgroundArcGradient = LinearGradient(colors: [.gray], startPoint: .leading, endPoint: .trailing)
        self.activeArcGradient = LinearGradient(gradient: Gradient(colors: [.accentColor, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
        
        self.lineWidth = 25
        self.rounded = true
        
        self.majorTickLength = 20
        self.majorTickCount = 9
        self.majorTickColor = .gray
        
        self.arrowLength = 120
        self.arrowGradient = LinearGradient(gradient: Gradient(colors: [.accentColor, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
        self.arrowAnchorMainCircleDiameter = 35
        self.arrowAnchorMainCircleGradient = LinearGradient(colors: [.gray], startPoint: .leading, endPoint: .trailing)
        self.arrowAnchorSecondaryCircleDiameter = 10
        self.arrowAnchorSecondaryCircleGradient = LinearGradient(colors: [.white], startPoint: .leading, endPoint: .trailing)
        self.arrowCornerRadius = 5
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

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
    
    init(percentage: Binding<Double>,
         backgroundArcGradient: LinearGradient = LinearGradient(colors: [.gray], startPoint: .leading, endPoint: .trailing),
         activeArcGradient: LinearGradient = LinearGradient(gradient: Gradient(colors: [.accentColor, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing),
         lineWidth: CGFloat = 25,
         rounded: Bool = true,
         majorTickLength: CGFloat = 20,
         majorTickCount: Int = 9,
         majorTickColor: Color = .gray,
         arrowLength: CGFloat = 120,
         arrowGradient: LinearGradient = LinearGradient(gradient: Gradient(colors: [.accentColor, .mint]), startPoint: .topLeading, endPoint: .bottomTrailing),
         arrowAnchorMainCircleDiameter: CGFloat = 35,
         arrowAnchorMainCircleGradient: LinearGradient = LinearGradient(colors: [.gray], startPoint: .leading, endPoint: .trailing),
         arrowAnchorSecondaryCircleDiameter: CGFloat = 10,
         arrowAnchorSecondaryCircleGradient: LinearGradient = LinearGradient(colors: [.white], startPoint: .leading, endPoint: .trailing),
         arrowCornerRadius: CGFloat = 5)
    {
        self._percentage = percentage
        self.backgroundArcGradient = backgroundArcGradient
        self.activeArcGradient = activeArcGradient
        self.arrowGradient = arrowGradient
        self.lineWidth = lineWidth
        self.rounded = rounded
        self.majorTickLength = majorTickLength
        self.majorTickCount = majorTickCount
        self.majorTickColor = majorTickColor
        self.arrowLength = arrowLength
        self.arrowAnchorMainCircleDiameter = arrowAnchorMainCircleDiameter
        self.arrowAnchorMainCircleGradient = arrowAnchorMainCircleGradient
        self.arrowAnchorSecondaryCircleDiameter = arrowAnchorSecondaryCircleDiameter
        self.arrowAnchorSecondaryCircleGradient = arrowAnchorSecondaryCircleGradient
        self.arrowCornerRadius = arrowCornerRadius
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

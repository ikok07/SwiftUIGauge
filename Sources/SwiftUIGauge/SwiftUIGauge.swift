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
    
    let width: CGFloat
    let height: CGFloat
    
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
    
    public init(
         percentage: Binding<Double>,
         width: CGFloat = 350,
         height: CGFloat = 350,
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
         arrowCornerRadius: CGFloat = 5
    )
    {
        self._percentage = percentage
        self.width = width
        self.height = height
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
                    .stroke(self.backgroundArcGradient, style: StrokeStyle(lineWidth: self.lineWidth, lineCap: self.rounded ? .round : .square, lineJoin: self.rounded ? .round : .miter))
                
                GaugeActiveArcShape(percentage: self.percentage)
                    .stroke(activeArcGradient, style: StrokeStyle(lineWidth: self.lineWidth, lineCap: self.rounded ? .round : .square, lineJoin: self.rounded ? .round : .miter))
                    .frame(width: self.width, height: self.height)
                    .rotationEffect(.degrees(45))
                    .animation(.bouncy, value: percentage)
                

                GaugeTicksShape(numberOfMajorTicks: self.majorTickCount - 1, majorTickLength: self.majorTickLength)
                    .stroke(self.majorTickColor, lineWidth: 3)
                    .frame(width: self.width, height: self.height)
                    .rotationEffect(.degrees(-105))

                ZStack {
                    GaugeArrowShape(anchorDiameter: self.arrowAnchorMainCircleDiameter, arrowLength: self.arrowLength, cornerRadius: self.arrowCornerRadius)
                        .fill(self.arrowGradient)
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

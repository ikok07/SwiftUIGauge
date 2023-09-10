//
//  SwiftUIView.swift
//  
//
//  Created by Kaloyan Petkov on 31.08.23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct GaugeCenterCircleView: View {
    
    public let arrowAnchorMainCircleDiameter: CGFloat
    public let arrowAnchorSecondaryCircleDiameter: CGFloat
    
    public let arrowAnchorMainCircleGradient: LinearGradient
    public let arrowAnchorSecondaryCircleGradient: LinearGradient
    
    public init(arrowAnchorMainCircleDiameter: CGFloat, arrowAnchorSecondaryCircleDiameter: CGFloat, arrowAnchorMainCircleGradient: LinearGradient, arrowAnchorSecondaryCircleGradient: LinearGradient) {
        self.arrowAnchorMainCircleDiameter = arrowAnchorMainCircleDiameter
        self.arrowAnchorSecondaryCircleDiameter = arrowAnchorSecondaryCircleDiameter
        self.arrowAnchorMainCircleGradient = arrowAnchorMainCircleGradient
        self.arrowAnchorSecondaryCircleGradient = arrowAnchorSecondaryCircleGradient
    }
    
    public var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(arrowAnchorMainCircleGradient)
                .frame(width: arrowAnchorMainCircleDiameter, height: arrowAnchorMainCircleDiameter)
            Circle()
                .foregroundStyle(arrowAnchorSecondaryCircleGradient)
                .frame(width: arrowAnchorSecondaryCircleDiameter, height: arrowAnchorSecondaryCircleDiameter)
        }
    }
}

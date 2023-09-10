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

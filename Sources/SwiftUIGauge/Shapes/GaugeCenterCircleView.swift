//
//  SwiftUIView.swift
//  
//
//  Created by Kaloyan Petkov on 31.08.23.
//

import SwiftUI

@available(iOS 15.0, *)
struct GaugeCenterCircleView: View {
    
    let arrowAnchorMainCircleDiameter: CGFloat
    let arrowAnchorSecondaryCircleDiameter: CGFloat
    
    let arrowAnchorMainCircleGradient: LinearGradient
    let arrowAnchorSecondaryCircleGradient: LinearGradient
    
    var body: some View {
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

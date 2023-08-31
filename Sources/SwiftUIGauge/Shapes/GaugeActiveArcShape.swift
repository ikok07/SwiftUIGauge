//
//  SwiftUIView.swift
//  
//
//  Created by Kaloyan Petkov on 31.08.23.
//

import SwiftUI

@available(iOS 15.0, *)
struct GaugeActiveArcShape: Shape {
    
    var percentage: Double
    
    var animatableData: Double {
        get { percentage }
        set { percentage = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let center: CGPoint = CGPoint(x: rect.midX, y: rect.midY)
        
        path.addArc(center: center, radius: rect.width / 2, startAngle: .degrees(100 + percentage * 250), endAngle: .degrees(100), clockwise: true)
        
        return path
    }
    
}

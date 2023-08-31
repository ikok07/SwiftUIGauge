//
//  SwiftUIView.swift
//  
//
//  Created by Kaloyan Petkov on 31.08.23.
//

import SwiftUI

@available(iOS 15.0, *)
struct GaugeBackgroundArcShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let center: CGPoint = CGPoint(x: rect.midX, y: rect.midY)
        
        path.addArc(center: center, radius: rect.width / 2, startAngle: .degrees(35), endAngle: .degrees(145), clockwise: true)
        
        return path
    }
    
}

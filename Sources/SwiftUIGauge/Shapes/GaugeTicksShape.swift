//
//  SwiftUIView.swift
//  
//
//  Created by Kaloyan Petkov on 31.08.23.
//

import SwiftUI

@available(iOS 15.0, *)
struct GaugeTicksShape: Shape {
    
    let totalAngle: CGFloat = 205
    let numberOfMajorTicks: Int
    let majorTickLength: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let centerX = rect.midX
        let centerY = rect.midY
         
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        
        let segmentAngle: Angle = Angle.degrees(totalAngle / Double(numberOfMajorTicks - 1))
        let segmentRadius = ((rect.width - majorTickLength) / 2) - 40
        
        
        for i in 0...numberOfMajorTicks {
            let tickAngle = Angle(degrees: Double(i) * segmentAngle.degrees - totalAngle / 2)
            let startX = centerX + CGFloat(cos(tickAngle.radians)) * segmentRadius
            let startY = centerY + CGFloat(sin(tickAngle.radians)) * segmentRadius
            let endX = startX + CGFloat(cos(tickAngle.radians)) * majorTickLength
            let endY = startY + CGFloat(sin(tickAngle.radians)) * majorTickLength
            
            path.move(to: CGPoint(x: startX, y: startY))
            path.addLine(to: CGPoint(x: endX, y: endY))
        }
        
        return path
    }
}

//
//  SwiftUIView.swift
//  
//
//  Created by Kaloyan Petkov on 31.08.23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct GaugeArrowShape: Shape {
    
    public let anchorDiameter: Double
    
    public let arrowLength: CGFloat
    public let cornerRadius: CGFloat // Adjust this value to control the roundness
    
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX - anchorDiameter / 2, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX - 4, y: rect.midY - arrowLength))
        path.addQuadCurve(to: CGPoint(x: rect.midX + 4, y: rect.midY - arrowLength),
                          control: CGPoint(x: rect.midX, y: rect.midY - arrowLength - cornerRadius))
        path.addLine(to: CGPoint(x: rect.midX + anchorDiameter / 2, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX - anchorDiameter / 2, y: rect.midY))
        
        return path
    }
}

//
//  GradientView.swift
//  URTH
//
//  Created by 장용범 on 03/07/2019.
//  Copyright © 2019 장용범. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    override func draw(_ rect: CGRect) {
        let colorSpace: CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.saveGState()
        
        let startColor: UIColor = UIColor(red: 221.0/255.0, green: 228.0/255.0, blue: 194.0/255.0, alpha: 1.0)
        let endColor: UIColor = UIColor(red: 116.0/255.0, green: 222.0/255.0, blue: 228.0/255.0, alpha: 1.0)
        let colors = [startColor.cgColor, endColor.cgColor]
        let locations: [CGFloat] = [0, 1]
        let gradient: CGGradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations)!
        
        let startPoint: CGPoint = CGPoint(x:rect.minX, y: rect.midY)
        let endPoint: CGPoint = CGPoint(x: rect.maxX, y: rect.maxY)
        let startPoint2: CGPoint = CGPoint(x:rect.minX, y: rect.midY)
        let endPoint2: CGPoint = CGPoint(x: rect.maxX, y: rect.minY)
        
        context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
        context.drawLinearGradient(gradient, start: startPoint2, end: endPoint2, options: [])

        context.restoreGState()
    }
    
}

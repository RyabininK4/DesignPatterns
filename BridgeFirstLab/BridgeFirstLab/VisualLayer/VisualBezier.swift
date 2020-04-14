//
//  VisualBezier.swift
//  BridgeFirstLab
//
//  Created by Kirill Ryabinin on 15.04.2020.
//  Copyright © 2020 Kirill Ryabinin. All rights reserved.
//

import Foundation
import UIKit

class VisualBezier: VisualCurve {
    
    private var a: IPoint
    private var b: IPoint
    private var c: IPoint
    private var d: IPoint
    
    init(a: IPoint, b: IPoint, c: IPoint, d: IPoint) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
    }
    
    override func getPoint(t: Double) -> IPoint {
        let bezier = Bezier(a: a, b: b, c: c, d: d)
        return bezier.getPoint(t: t)
    }
    
    override func drawFigure(imageView: UIImageView, step: Double) {
        
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, 0)
        imageView.image?.draw(in: imageView.bounds)

        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(2.0)
        context?.setBlendMode(CGBlendMode.normal)
        
        let startPoint: IPoint = a
        var startX = startPoint.getX()
        var startY = startPoint.getY()
        var finishX = 0.0
        var finishY = 0.0

        var t = 0.0
        
        while t < 1 {
            t += step
            
            let p = getPoint(t: t)
            finishX = p.getX()
            finishY = p.getY()
            
            context?.move(to: CGPoint(x: startX, y: startY))
            context?.addLine(to: CGPoint(x: finishX, y: finishY))
            startX = finishX
            startY = finishY
        }

        context?.strokePath()

        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
}

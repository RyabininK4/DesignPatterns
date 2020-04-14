//
//  VisualLine.swift
//  BridgeFirstLab
//
//  Created by Kirill Ryabinin on 14.04.2020.
//  Copyright © 2020 Kirill Ryabinin. All rights reserved.
//

import Foundation
import UIKit

class VisualLine: VisualCurve {
    
    private var a: IPoint
    private var b: IPoint
    
    init(a: IPoint, b: IPoint) {
        self.a = a
        self.b = b
    }
    
    override func getPoint(t: Double) -> IPoint {
        let line = Line(a: a, b: b)
        return line.getPoint(t: t)
    }
    
    override func drawFigure(imageView: UIImageView, step: Double) {
        
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, 0)
        imageView.image?.draw(in: imageView.bounds)

        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.red.cgColor)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(1.0)
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

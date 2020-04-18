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
    
    init(a: IPoint, b: IPoint, c: IPoint, d: IPoint, scheme: VisualizationScheme, n: Int) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        super.init(scheme: scheme, n: n)
    }
    
    override func getPoint(t: Double) -> IPoint {
        let bezier = Bezier(a: a, b: b, c: c, d: d)
        return bezier.getPoint(t: t)
    }
    
    override func drawFigure() {
        
        let startPoint: IPoint = a
        var startX = startPoint.getX()
        var startY = startPoint.getY()
        var finishX = 0.0
        var finishY = 0.0
        
        drawStartPoint(point: Point(x: startX, y: startY))

        var t = 0.0

        while t < 1 {
            t += 1.0 / Double(n)

            let p = getPoint(t: t)
            finishX = p.getX()
            finishY = p.getY()
            
            drawLineSegment(start: Point(x: startX, y: startY), end: Point(x: finishX, y: finishY))

            startX = finishX
            startY = finishY
        }
        
        drawEndPoint(point: Point(x: finishX, y: finishY))
    }
}

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
    
    init(a: IPoint, b: IPoint, scheme: VisualizationScheme, n: Int) {
        self.a = a
        self.b = b
        super.init(scheme: scheme, n: n)
    }
    
    override func getPoint(t: Double) -> IPoint {
        let line = Line(a: a, b: b)
        return line.getPoint(t: t)
    }
    
    override func drawFigure() {
        
        let startPoint: IPoint = a

        var t = 0.0
        
        var startX = startPoint.getX()
        var startY = startPoint.getY()
        var finishX = 0.0
        var finishY = 0.0
        
        drawStartPoint(point: Point(x: startX, y: startY))
        
        while t < 1 {
            t += 1.0 / Double(n)
            
            let p = getPoint(t: t)
            finishX = p.getX()
            finishY = p.getY()
            
            drawLineSegment(start: Point(x: startX, y: startY), end: Point(x: finishX, y: finishY))
 
                startX = finishX
                startY = finishX
            
        }
        
        let finishP = getPoint(t: 1)
        finishX = finishP.getX()
        finishY = finishP.getY()
        drawEndPoint(point: Point(x: startX, y: startY))
    }    
}

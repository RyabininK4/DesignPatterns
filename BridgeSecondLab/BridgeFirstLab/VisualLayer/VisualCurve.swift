//
//  VisualCurve.swift
//  BridgeFirstLab
//
//  Created by Kirill Ryabinin on 14.04.2020.
//  Copyright © 2020 Kirill Ryabinin. All rights reserved.
//

import Foundation
import UIKit

class VisualCurve: ICurve, IDrawable {
    
    var scheme: VisualizationScheme
    var n: Int
    
    func drawFigure() { }
        
    func getPoint(t: Double) -> IPoint {
        return IPoint.self as! IPoint
    }
    
    func drawLineSegment(start: Point, end: Point) {
        scheme.drawLineSegment(start: start, end: end)
    }
    func drawStartPoint(point: Point) {
        scheme.drawStartPoint(point: point)
    }
    func drawEndPoint(point: Point) {
        scheme.drawEndPoint(point: point)
    }
    
    init(scheme: VisualizationScheme, n: Int) {
        self.scheme = scheme
        self.n = n
    }
}

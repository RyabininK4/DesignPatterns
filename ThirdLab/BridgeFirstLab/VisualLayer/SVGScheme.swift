//
//  SVGScheme.swift
//  BridgeFirstLab
//
//  Created by Kirill Ryabinin on 20.04.2020.
//  Copyright © 2020 Kirill Ryabinin. All rights reserved.
//

import Foundation
import UIKit
import SVGKit

class SVGSheme: VScheme {
    
    var svgFile = ""
    var contextLine = UIGraphicsGetCurrentContext()
    var contextStartPoint = UIGraphicsGetCurrentContext()
    var contextEndPoint = UIGraphicsGetCurrentContext()
    
    
    func drawLineSegment(start: Point, end: Point) {
        
        let x1 = start.getX()
        let x2 = end.getX()
        let y1 = start.getY()
        let y2 = end.getY()

        svgFile += contextLine.convertToHTML() // Пример convertToHTML "<line x1=\(x1) y1=\(y1) x2=\(x2) y2=\(y2) ..."
        
        
        
        print("LINE TAG")
    }
    
    func drawStartPoint(point: Point) {
        
        svgFile += contextStartPoint.convertToHTML()
        
        // Можно не использовать point, т.к с помощью фреймворка можно получить нужные данные о точке из contextStartPoint
        
        print("START POINT TAG")
    }
    
    func drawEndPoint(point: Point) {
        
        svgFile += contextEndPoint.convertToHTML()
        
        // Можно не использовать point, т.к с помощью фреймворка можно получить нужные данные о точке из contextEndPoint
        
        print("END POINT TAG")
    }
}

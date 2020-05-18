//
//  SchemeTwo.swift
//  BridgeFirstLab
//
//  Created by Kirill Ryabinin on 18.04.2020.
//  Copyright © 2020 Kirill Ryabinin. All rights reserved.
//

import Foundation
import UIKit

class SchemeTwo: VisualizationScheme {
    
    var imageView: UIImageView!
    var svgScheme = SVGSheme()
    
    override func drawLineSegment(start: Point, end: Point) {
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, 0)
        imageView.image?.draw(in: imageView.bounds)

        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.green.cgColor)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(2.0)
        context?.setBlendMode(CGBlendMode.normal)

        context?.move(to: CGPoint(x: start.getX(), y: start.getY()))
        context?.addLine(to: CGPoint(x: end.getX(), y: end.getY()))

        context?.strokePath()

        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // FOR SVG
        
        svgScheme.contextLine = context
        svgScheme.drawLineSegment(start: start, end: end)
    }
    
    override func drawStartPoint(point: Point) {
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, 0)
        imageView.image?.draw(in: imageView.bounds)
        
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        context?.setFillColor(UIColor.green.cgColor)
        context?.fillEllipse(in: CGRect(x: point.getX(), y: point.getY(), width: 4, height: 4))
        context?.restoreGState()

        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // FOR SVG
        
        svgScheme.contextStartPoint = context
        svgScheme.drawStartPoint(point: point)
    }
    
    override func drawEndPoint(point: Point) {

        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, 0)
        imageView.image?.draw(in: imageView.bounds)

        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.green.cgColor)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(2.0)
        context?.setBlendMode(CGBlendMode.normal)

        context?.move(to: CGPoint(x: point.getX() + 4, y: point.getY() + 4))
        context?.addLine(to: CGPoint(x: point.getX(), y: point.getY()))
        context?.addLine(to: CGPoint(x: point.getX() - 4, y: point.getY() + 4))

        context?.strokePath()

        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // FOR SVG
        
        svgScheme.contextEndPoint = context
        svgScheme.drawEndPoint(point: point)
    }
}

//
//  SchemeOne.swift
//  BridgeFirstLab
//
//  Created by Kirill Ryabinin on 18.04.2020.
//  Copyright © 2020 Kirill Ryabinin. All rights reserved.
//

import Foundation
import UIKit

class SchemeOne: VisualizationScheme {
    
    var imageView: UIImageView!
    var svgScheme = SVGSheme()
    
    override func drawLineSegment(start: Point, end: Point) {
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, 0)
        imageView.image?.draw(in: imageView.bounds)

        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(1.0)
        context?.setBlendMode(CGBlendMode.normal)

        context?.move(to: CGPoint(x: start.getX(), y: start.getY()))
        context?.addLine(to: CGPoint(x: end.getX() - 5, y: end.getY() - 5))

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
        context?.setLineWidth(5.0)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.addRect(CGRect(x: point.getX(), y: point.getY(), width: 5, height: 5))
        context?.strokePath()

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
        context?.setLineWidth(5.0)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.addRect(CGRect(x: point.getX(), y: point.getY(), width: 5, height: 5))
        context?.strokePath()

        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // FOR SVG
        
        svgScheme.contextEndPoint = context
        svgScheme.drawEndPoint(point: point)
    }
}

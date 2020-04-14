//
//  Bezier.swift
//  BridgeFirstLab
//
//  Created by Kirill Ryabinin on 14.04.2020.
//  Copyright © 2020 Kirill Ryabinin. All rights reserved.
//

import Foundation

class Bezier: ACurve {
    
    private var c: IPoint
    private var d: IPoint
    
    init(a: IPoint, b: IPoint, c: IPoint, d: IPoint) {
        self.c = c
        self.d = d
        super.init(a: a, b: b)
    }
    
    override func getPoint(t: Double) -> IPoint {
        
        let iPoint = Point(x: 0, y: 0)

        
        let firstX = pow((1 - t), 3) * a.getX()
        let secondX = 3 * t * pow((1 - t), 2) * c.getX()
        let thirdX = 3 * pow(t, 2) * (1 - t) * d.getX()
        let fourthX = pow(t, 3) * b.getX()
        
        iPoint.setX(x: firstX + secondX + thirdX + fourthX)
        
        
        
        let firstY = pow((1 - t), 3) * a.getY()
        let secondY = 3 * t * pow((1 - t), 2) * c.getY()
        let thirdY = 3 * pow(t, 2) * (1 - t) * d.getY()
        let fourthY = pow(t, 3) * b.getY()
        
        iPoint.setY(y: firstY + secondY + thirdY + fourthY)
        
        return iPoint
    }
}

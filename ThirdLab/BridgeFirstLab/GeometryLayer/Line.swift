//
//  Line.swift
//  BridgeFirstLab
//
//  Created by Kirill Ryabinin on 14.04.2020.
//  Copyright © 2020 Kirill Ryabinin. All rights reserved.
//

import Foundation

class Line: ACurve {
    
    override func getPoint(t: Double) -> IPoint {
        let iPoint = Point(x: 0, y: 0)
        
        iPoint.setX(x: (1 - t) * a.getX() + t * b.getX())
        iPoint.setY(y: (1 - t) * a.getY() + t * b.getY())
        
        return iPoint
    }
}

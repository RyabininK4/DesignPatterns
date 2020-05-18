//
//  MoveTo.swift
//  BridgeFirstLab
//
//  Created by Ryabinin on 17.05.2020.
//  Copyright © 2020 Kirill Ryabinin. All rights reserved.
//

import Foundation

class MoveTo: Decorator {
    
    private var xNew: Double = 0.0
    private var yNew: Double = 0.0
    
    init(iCurve: ICurve, p: IPoint, position: Double) {
        super.init(iCurve: iCurve)
        
        var pNew: IPoint
        
        if min(0.0, position) == 0 && max(1.0, position) == 1.0 {
            pNew = iCurve.getPoint(t: position)
        } else {
            pNew = iCurve.getPoint(t: 0.0)
        }
        
        xNew = p.getX() - pNew.getX()
        yNew = p.getY() - pNew.getY()
    }
    
    func getX() -> Double {
        return xNew
    }
    
    func getY() -> Double {
        return yNew
    }
    
    override func getPoint(t: Double) -> IPoint {
        let pNew = iCurve.getPoint(t: t)
        let x = pNew.getX() + xNew
        let y = pNew.getY() + yNew
        return Point(x: x, y: y)
    }
}

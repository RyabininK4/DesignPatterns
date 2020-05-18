//
//  Decorator.swift
//  BridgeFirstLab
//
//  Created by Ryabinin on 17.05.2020.
//  Copyright © 2020 Kirill Ryabinin. All rights reserved.
//

import Foundation

class Decorator: ICurve {
    
    var iCurve: ICurve
    
    init(iCurve: ICurve) {
        self.iCurve = iCurve
    }
    
    func getPoint(t: Double) -> IPoint {
        return IPoint.self as! IPoint
    }
}

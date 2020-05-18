//
//  ACurve.swift
//  BridgeFirstLab
//
//  Created by Kirill Ryabinin on 14.04.2020.
//  Copyright © 2020 Kirill Ryabinin. All rights reserved.
//

import Foundation

class ACurve: ICurve {
    
    func getPoint(t: Double) -> IPoint {
        return IPoint.self as! IPoint
    }
    
    var a: IPoint
    var b: IPoint
    
    init(a: IPoint, b: IPoint) {
        self.a = a
        self.b = b
    }
}

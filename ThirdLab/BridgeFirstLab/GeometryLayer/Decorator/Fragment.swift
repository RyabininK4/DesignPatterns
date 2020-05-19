//
//  Fragment.swift
//  BridgeFirstLab
//
//  Created by Ryabinin on 17.05.2020.
//  Copyright © 2020 Kirill Ryabinin. All rights reserved.
//

import Foundation

class Fragment: Decorator {
    
    private var tStart: Double = 0.0
    private var tFinish: Double = 0.0
    
    init(tStart: Double, tFinish: Double, iCurve: ICurve) {
        super.init(iCurve: iCurve)
        self.tStart = tStart
        self.tFinish = tFinish
    }
    
    override func getPoint(t: Double) -> IPoint {
        
        var tParam = t
        
        if max(t, tStart) == tStart {
            tParam = tStart
        } else if min(t, tFinish) == tFinish {
            tParam = tFinish
        }
//
//        Вариант предложенный преподавателем
//
//        if (0.0 < tParam) && (tParam < 1.0) {
//            tParam = tStart + t * (tFinish - tStart)
//        }
//
        
        return iCurve.getPoint(t: tParam)
    }
}

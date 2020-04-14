//
//  Point.swift
//  BridgeFirstLab
//
//  Created by Kirill Ryabinin on 14.04.2020.
//  Copyright © 2020 Kirill Ryabinin. All rights reserved.
//

import Foundation

class Point: IPoint {
    
    private var x: Double
    private var y: Double
    
    func setX(x: Double) {
        self.x = x
    }
    
    func setY(y: Double) {
        self.y = y
    }
    
    func getX() -> Double {
        return self.x
    }
    
    func getY() -> Double {
        return self.y
    }
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
}

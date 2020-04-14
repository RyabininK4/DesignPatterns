//
//  VisualCurve.swift
//  BridgeFirstLab
//
//  Created by Kirill Ryabinin on 14.04.2020.
//  Copyright © 2020 Kirill Ryabinin. All rights reserved.
//

import Foundation
import UIKit

class VisualCurve: ICurve, IDrawable {
    
    func drawFigure(imageView: UIImageView, step: Double) {}
        
    func getPoint(t: Double) -> IPoint {
        return IPoint.self as! IPoint
    }
}

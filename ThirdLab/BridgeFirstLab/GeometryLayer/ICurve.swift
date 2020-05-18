//
//  ICurve.swift
//  BridgeFirstLab
//
//  Created by Kirill Ryabinin on 14.04.2020.
//  Copyright © 2020 Kirill Ryabinin. All rights reserved.
//

import Foundation
import UIKit

protocol ICurve {
    
    func getPoint(t: Double) -> IPoint
    
}

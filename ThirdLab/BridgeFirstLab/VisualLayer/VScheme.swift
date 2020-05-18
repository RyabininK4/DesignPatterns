//
//  VScheme.swift
//  BridgeFirstLab
//
//  Created by Kirill Ryabinin on 18.04.2020.
//  Copyright © 2020 Kirill Ryabinin. All rights reserved.
//

import Foundation

protocol VScheme {
    
    func drawLineSegment(start: Point, end: Point)
    func drawStartPoint(point: Point)
    func drawEndPoint(point: Point)
}

//
//  ViewController.swift
//  BridgeFirstLab
//
//  Created by Kirill Ryabinin on 14.04.2020.
//  Copyright © 2020 Kirill Ryabinin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!

    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLineImage()
        configureSecondImage()
    }
    
    
    
    // MARK: - Configure
    
    func configureLineImage() {
        let a = Point(x: 0, y: 0)
        let b = Point(x: 100, y: 100)
        
        let line = VisualLine(a: a, b: b)
        line.drawFigure(imageView: firstImageView, step: 0.1)
    }
    
    func configureSecondImage() {
        let a = Point(x: 0, y: 100)
        let b = Point(x: 100, y: 0)
        let c = Point(x: 17, y: 67)
        let d = Point(x: 92, y: 67)
        
        let line = VisualBezier(a: a, b: b, c: c, d: d)
        line.drawFigure(imageView: secondImageView, step: 0.1)
    }
}

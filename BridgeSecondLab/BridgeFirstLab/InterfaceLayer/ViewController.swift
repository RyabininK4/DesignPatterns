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
    @IBOutlet weak var firstSaveButton: UIButton!
    @IBOutlet weak var secondSaveButton: UIButton!
    
    let firstScheme = SchemeOne()
    let secondScheme = SchemeTwo()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstSaveButton.isEnabled = false
        secondSaveButton.isEnabled = false
        firstSaveButton.backgroundColor = .lightGray
        secondSaveButton.backgroundColor = .lightGray
    }
    
    
    
    // MARK: - Configure
    
    func configureLineImage() {
        let a = Point(x: 0, y: 0)
        let b = Point(x: 200, y: 200)
        
        firstScheme.imageView = firstImageView
        
        let line = VisualLine(a: a, b: b, scheme: firstScheme, n: 8)
        line.drawFigure()
    }
    
    func configureSecondImage() {
        let a = Point(x: 0, y: 200)
        let b = Point(x: 200, y: 0)
        let c = Point(x: 34, y: 134)
        let d = Point(x: 184, y: 134)
        
        secondScheme.imageView = secondImageView
        
        let bezier = VisualBezier(a: a, b: b, c: c, d: d, scheme: secondScheme, n: 8)
        bezier.drawFigure()
    }
    
    
    
    // MARK: - Actions
    
    @IBAction func generationAction(_ sender: Any) {
        configureLineImage()
        configureSecondImage()
        
        firstSaveButton.isEnabled = true
        secondSaveButton.isEnabled = true
        
        firstSaveButton.backgroundColor = .systemBlue
        secondSaveButton.backgroundColor = .systemBlue
    }
    
    @IBAction func saveFirstAction(_ sender: Any) {

        let file = firstScheme.svgScheme.svgFile
        file.write(to: FileManager.default.appendingPathComponent("svgFileOne.txt"))
        
        firstSaveButton.setTitle("Файл сохранен", for: .normal)
        firstSaveButton.isEnabled = false
        firstSaveButton.backgroundColor = .lightGray
    }
    
    @IBAction func saveSecondAction(_ sender: Any) {
        
        let file = secondScheme.svgScheme.svgFile
        file.write(to: FileManager.default.appendingPathComponent("svgFileTwo.txt"))
        
        secondSaveButton.setTitle("Файл сохранен", for: .normal)
        secondSaveButton.isEnabled = false
        secondSaveButton.backgroundColor = .lightGray
    }
}

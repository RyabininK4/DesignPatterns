//
//  ViewController.swift
//  BridgeFirstLab
//
//  Created by Kirill Ryabinin on 14.04.2020.
//  Copyright © 2020 Kirill Ryabinin. All rights reserved.
//

import UIKit
import SVGKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var firstSaveButton: UIButton!
    @IBOutlet weak var secondSaveButton: UIButton!
    
    
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
        
        let vScheme = SchemeOne()
        vScheme.imageView = firstImageView
        
        let line = VisualLine(a: a, b: b, scheme: vScheme, n: 8)
        line.drawFigure()
    }
    
    func configureSecondImage() {
        let a = Point(x: 0, y: 200)
        let b = Point(x: 200, y: 0)
        let c = Point(x: 34, y: 134)
        let d = Point(x: 184, y: 134)
        
        let vScheme = SchemeTwo()
        vScheme.imageView = secondImageView
        
        let bezier = VisualBezier(a: a, b: b, c: c, d: d, scheme: vScheme, n: 8)
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
        guard let image = firstImageView.image else { return }
        
        if saveImage(image: image) {
            firstSaveButton.setTitle("Файл сохранен", for: .normal)
            firstSaveButton.isEnabled = false
            firstSaveButton.backgroundColor = .lightGray
        } else {
            firstSaveButton.setTitle("Файл не сохранен", for: .normal)
        }
    }
    
    @IBAction func saveSecondAction(_ sender: Any) {
        guard let image = secondImageView.image else { return }
        
        if saveImage(image: image) {
            secondSaveButton.setTitle("Файл сохранен", for: .normal)
            secondSaveButton.isEnabled = false
            secondSaveButton.backgroundColor = .lightGray
        } else {
            secondSaveButton.setTitle("Файл не сохранен", for: .normal)
        }
    }
    
    
    
    // MARK: - Utils
    
    func saveImage(image: UIImage) -> Bool {
        guard let data = image.svgData() else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent("fileName.png")!)
            return true
        } catch {
            return false
        }
    }
}

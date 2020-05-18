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
    
    var a = Point(x: 0, y: 0)
    var b = Point(x: 100, y: 100)
    var c = Point(x: 17, y: 60)
    var d = Point(x: 90, y: 60)
    
    
    var point = Point(x: 50, y: 100)
    
    
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
        firstScheme.imageView = firstImageView
        
        let line = VisualLine(a: a, b: b, scheme: firstScheme, n: 8)
        line.drawFigure()
    }
    
    func configureSecondImage() {
        
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
    
    @IBAction func changeStartFinishPoint(_ sender: Any) {
        let addPoint = a
        a = b
        b = addPoint
        
        self.firstImageView.image = nil
        self.secondImageView.image = nil
        
        configureLineImage()
        configureSecondImage()
    }
    
    @IBAction func displaceAction(_ sender: Any) {
        displaceFirstImage()
        displaceSecondImage()
    }
    
    @IBAction func combineAction(_ sender: Any) {
        combineFirstImage()
        combineSecondImage()
    }
    
    
    
    // MARK: - Displace
    
    fileprivate func displaceFirstImage() {
        
        self.firstImageView.image = nil
        
        configureLineImage()
        
        let line = Line(a: a, b: b)
        let fragment = Fragment(tStart: 0.0, tFinish: 0.5, iCurve: line)
        let curveMove = MoveTo(iCurve: fragment, p: point)
        let aNew = curveMove.getPoint(t: 0.0)
        let bNew = curveMove.getPoint(t: 1.0)

        VisualLine(a: aNew, b: bNew, scheme: firstScheme, n: 8).drawFigure()
    }
    
    fileprivate func displaceSecondImage() {
        
        self.secondImageView.image = nil
        
        configureSecondImage()
        
        let bezier = Bezier(a: a, b: b, c: c, d: d)

        let fragmentOne = Fragment(tStart: 0, tFinish: 0.5, iCurve: bezier)
        let curveMove = MoveTo(iCurve: fragmentOne, p: point)
        let aNew = curveMove.getPoint(t: 0.0)
        let bNew = curveMove.getPoint(t: 1.0)
        let valx = curveMove.getX()
        let valy = curveMove.getY()
        
        let newC = Point(x: c.getX() + valx, y: c.getY() + valy)
        let newD = Point(x: d.getX() + valx, y: d.getY() + valy)

        VisualBezier(a: aNew, b: bNew, c: newC, d: newD, scheme: secondScheme, n: 8).drawFigure()
    }
    
    
    
    // MARK: - Combine
    
    fileprivate func combineFirstImage() {
        
        let line = Line(a: a, b: b)

        let fragmentOne = Fragment(tStart: 0.0, tFinish: 0.5, iCurve: line)
        var moveTo = MoveTo(iCurve: fragmentOne, p: point)
        var newa = moveTo.getPoint(t: 0.0)
        var newb = moveTo.getPoint(t: 1.0)
        VisualLine(a: newa, b: newb, scheme: firstScheme, n: 8).drawFigure()

        let fragmentTwo = Fragment(tStart: 0.5, tFinish: 1.0, iCurve: line)
        moveTo = MoveTo(iCurve: fragmentTwo, p: newb)
        newa = moveTo.getPoint(t: 0.0)
        newb = moveTo.getPoint(t: 1.0)
        VisualLine(a: newa, b: newb, scheme: firstScheme, n: 8).drawFigure()
    }
    
    fileprivate func combineSecondImage() {
        
        let bezier = Bezier(a: a, b: b, c: c, d: d)
        
        let fragmentOne = Fragment(tStart: 0.0, tFinish: 0.5, iCurve: bezier)
        var moveTo = MoveTo(iCurve: fragmentOne, p: point)
        var newa = moveTo.getPoint(t: 0.0)
        var newb = moveTo.getPoint(t: 1.0)
        var valx = moveTo.getX()
        var valy = moveTo.getY()
        var newC = Point(x: c.getX() + valx, y: c.getY() + valy)
        var newD = Point(x: d.getX() + valx, y: d.getY() + valy)
       
        VisualBezier(a: newa, b: newb, c: newC, d: newD, scheme: secondScheme, n: 8).drawFigure()
        
        let fragmentTwo = Fragment(tStart: 0.5, tFinish: 1.0, iCurve: bezier)
        moveTo = MoveTo(iCurve: fragmentTwo, p: newb)
        newa = moveTo.getPoint(t: 0.0)
        newb = moveTo.getPoint(t: 1.0)
        valx = moveTo.getX()
        valy = moveTo.getY()
        newC = Point(x: c.getX() + valx, y: c.getY() + valy)
        newD = Point(x: d.getX() + valx, y: d.getY() + valy)
        
        VisualBezier(a: newa, b: newb, c: newC, d: newD, scheme: secondScheme, n: 8).drawFigure()
    }
}

//
//  ViewController.swift
//  DrawGraphicsExercise
//
//  Created by Aaron Lee on 7/20/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        drawImage()
    }
    
    func drawImage() {
        let x = 120
        let y = 150
        let difference = 50
        let width = 100
        let height = 100
        
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Triangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.setFillColor(UIColor.red.cgColor)
        
        context.move(to: CGPoint(x: 140, y: 450))
        context.addLine(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 200, y: 450))
        context.addLine(to: CGPoint(x: 140, y: 450))
        
        context.fillPath()
        context.strokePath()
        
        // Draw 1st Circles
        context.setStrokeColor(UIColor.green.cgColor)
        context.addEllipse(in: CGRect(x: x, y: y, width: width, height: height))
        context.strokePath()
        
        // Draw 2nd Circles
        context.addEllipse(in: CGRect(x: x+difference, y: y, width: width, height: height))
        context.strokePath()
        
        // Draw 3rd Circles
        context.addEllipse(in: CGRect(x: x-difference, y: y, width: width, height: height))
        context.strokePath()
        
        // Draw 4th Circles
        context.addEllipse(in: CGRect(x: x, y: y-difference, width: width, height: height))
        context.strokePath()
        
        // Draw 5th Circles
        context.addEllipse(in: CGRect(x: x, y: y+difference, width: width, height: height))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    
}


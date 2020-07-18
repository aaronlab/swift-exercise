//
//  ViewController.swift
//  ImageViewExerciese
//
//  Created by Aaron Lee on 7/18/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imgIndex: Int = 1
//    var img: UIImage?

    @IBOutlet weak var imgView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let img = UIImage(named: "\(imgIndex).png")
        imgView.image = img
    }

    @IBAction func prevBtnAction(_ sender: Any) {
        if imgIndex < 2 {
            imgIndex = 6
        } else {
            imgIndex -= 1
        }
        let img = UIImage(named: "\(imgIndex).png")
        imgView.image = img
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        if imgIndex > 5 {
            imgIndex = 1
        } else {
            imgIndex += 1
        }
        let img = UIImage(named: "\(imgIndex).png")
        imgView.image = img
    }
}


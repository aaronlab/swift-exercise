//
//  ViewController.swift
//  Tab
//
//  Created by Aaron Lee on 7/19/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1     // go to image view tab
    }
    
    @IBAction func btnMoveDatePicker(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2     // go to date picker view tab
    }
}


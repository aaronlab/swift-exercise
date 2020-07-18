//
//  ViewController.swift
//  Alert
//
//  Created by Aaron Lee on 7/18/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // images
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    
    var isLampOn = true

    @IBOutlet weak var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show img
        lampImg.image = imgOn
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if isLampOn {
            // alert: if it's on, alert
            let lampOnAlert = UIAlertController(title: "Warning!", message: "It's already on!", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "Continue", style: .default, handler: nil)
            lampOnAlert.addAction(onAction)
            
            present(lampOnAlert, animated: true, completion: nil)
        } else {
            // turn on
            lampImg.image = imgOn
            isLampOn = true
        }
    }
    
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn {
            let lampOffAlert = UIAlertController(title: "Confirm", message: "Are you sure you want to turn it off?", preferredStyle: .alert)
            let offAction = UIAlertAction(title: "Yes", style: .default, handler: { ACTION in
                self.lampImg.image = self.imgOff
                self.isLampOn = false
            })
            
            let cancelAction = UIAlertAction(title: "No", style: .default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil)
            
        } else {
            let lampOffAlert = UIAlertController(title: "Warning!", message: "It's already off!", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Continue", style: .default, handler: nil)
            
            lampOffAlert.addAction(alertAction)
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "Confirm", message: "Are you sure you want to remove it?", preferredStyle: .alert)
        
        let offAction = UIAlertAction(title: "No, turn it off", style: .default, handler: {ACTION in
            self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        
        let onAction = UIAlertAction(title: "No, turn it on", style: .default, handler: {ACTION in
            self.lampImg.image = self.imgOn
            self.isLampOn = true
        })
        
        let removeAction = UIAlertAction(title: "Yes, remove it.", style: .default, handler: {ACTION in
            self.lampImg.image = self.imgRemove
            self.isLampOn = false
        })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
    }
    
}


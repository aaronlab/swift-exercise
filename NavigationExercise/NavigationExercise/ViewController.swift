//
//  ViewController.swift
//  NavigationExercise
//
//  Created by Aaron Lee on 7/19/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
          
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    var isOn = true
    
    var isZoom = false
    var orgZoom = false
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.image = imgOn
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            // when the button clicked
            editViewController.textWayValue = "segue: use button"
        } else if segue.identifier == "editBarButton" {
            // when the editBarButton clicked
            editViewController.textWayValue = "segue: use bar button"
        }
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = isZoom
        editViewController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }

    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        let scale:CGFloat = 1.5
        var newWidth:CGFloat, newHeight:CGFloat
        
        if isZoom {
            if orgZoom {
                
            } else {
                self.isZoom = false
                self.orgZoom = true
                newWidth = imgView.frame.width*scale
                newHeight = imgView.frame.height*scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            }
        } else {
            if orgZoom {
                self.isZoom = true
                self.orgZoom = false
                newWidth = imgView.frame.width/scale
                newHeight = imgView.frame.height/scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            } else {
                
            }
        }
    }

}


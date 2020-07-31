//
//  ViewController.swift
//  UserDefaultsExercise
//
//  Created by Aaron Lee on 7/31/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

// MARK: - Struct
struct Settings {
    enum State: String{
        case Email
        case Vibrate
        case Sound
        case Bright
    }
}

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblVibration: UILabel!
    @IBOutlet weak var lblSound: UILabel!
    @IBOutlet weak var lblBrightness: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load Data
        updateContents()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Load Data
        updateContents()
    }


}

// MARK: - Functions
extension ViewController {
    func updateContents() {
        let userDefaults = UserDefaults.standard
        
        if let email = userDefaults.value(forKey: Settings.State.Email.rawValue),
            let vibrate = userDefaults.value(forKey: Settings.State.Vibrate.rawValue),
            let sound = userDefaults.value(forKey: Settings.State.Sound.rawValue),
            let bright = userDefaults.value(forKey: Settings.State.Bright.rawValue) {
            
            // Load Data
            let brightValue = (bright as! Float) * 100
            let formattedBrightValue = String(format: "%.0f", brightValue)
            
            // Set Data into Labels
            lblEmail.text = email as? String
            (vibrate as! Bool == true) ? (lblVibration.text = "is on") : (lblVibration.text = "is off")
            (sound as! Bool == true) ? (lblSound.text = "is on") : (lblSound.text = "is off")
            lblBrightness.text = "\(formattedBrightValue) %"
        } else {
            // Default Settings
            lblEmail.text = "has not existed yet"
            lblVibration.text = "is on"
            lblSound.text = "is on"
            lblBrightness.text = "50 %"
        }
    }
}


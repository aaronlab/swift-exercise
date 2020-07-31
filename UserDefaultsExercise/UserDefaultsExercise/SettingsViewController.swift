//
//  SettingsViewController.swift
//  UserDefaultsExercise
//
//  Created by Aaron Lee on 7/31/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

// MARK: - SettingsViewController.swift

class SettingsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var swVibration: UISwitch!
    @IBOutlet weak var swSound: UISwitch!
    @IBOutlet weak var slBrightness: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setState()
    }
    
}

// MARK: - Functions
extension SettingsViewController {
    func setState() {
        let userDefaults = UserDefaults.standard
        if let email = userDefaults.value(forKey: Settings.State.Email.rawValue),
            let vibrate = userDefaults.value(forKey: Settings.State.Vibrate.rawValue),
            let sound = userDefaults.value(forKey: Settings.State.Sound.rawValue),
            let bright = userDefaults.value(forKey: Settings.State.Bright.rawValue) {
            
            // Load Data
            txtEmail.text = email as? String
            swVibration.isOn = vibrate as! Bool
            swSound.isOn = sound as! Bool
            slBrightness.value = bright as! Float
        } else {
            // Default Settings
            txtEmail.text = ""
            swVibration.isOn = true
            swSound.isOn = true
            slBrightness.value = 0.5
        }
    }
}

// MARK: - IBActions
extension SettingsViewController {
    @IBAction func saveBtnTapped(_ sender: Any) {
        // Set Data
        UserDefaults.standard.set(txtEmail.text, forKey: Settings.State.Email.rawValue)
        UserDefaults.standard.set(swVibration.isOn, forKey: Settings.State.Vibrate.rawValue)
        UserDefaults.standard.set(swSound.isOn, forKey: Settings.State.Sound.rawValue)
        UserDefaults.standard.set(slBrightness.value, forKey: Settings.State.Bright.rawValue)
        
        // Call VC
        navigationController?.popViewController(animated: true)
    }
}

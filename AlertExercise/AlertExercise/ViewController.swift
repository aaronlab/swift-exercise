//
//  ViewController.swift
//  AlertExercise
//
//  Created by Aaron Lee on 7/18/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    
    var currentTime: String?
    var selectedTime: String?
    
    let alarmInterval = 60.0
    var alertFlag = false
    
    @IBOutlet weak var lblNow: UILabel!
    @IBOutlet weak var lblSelected: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePicker = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EE"
        lblSelected.text = formatter.string(from: datePicker.date)
        
        formatter.dateFormat = "HH:mm"
        selectedTime = formatter.string(from: datePicker.date)
    }
    
    @objc func updateTime () {
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblNow.text = formatter.string(from: date as Date)
        
        formatter.dateFormat = "HH:mm"
        currentTime = formatter.string(from: date as Date)
        
        if currentTime == selectedTime {
            if !alertFlag {
                let alert = UIAlertController(title: "Alert", message: "You gonna wake up!", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
                
                alert.addAction(alertAction)
                present(alert, animated: true, completion: nil)
                
                alertFlag = true

            }
        } else {
            alertFlag = false
        }
    }

}


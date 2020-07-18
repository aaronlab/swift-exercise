//
//  ViewController.swift
//  DatePickerExercise
//
//  Created by Aaron Lee on 7/18/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    
    var alertTime: String?

    @IBOutlet weak var lblNow: UILabel!
    @IBOutlet weak var lblSelected: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)

    }

    @IBAction func datePicker(_ sender: UIDatePicker) {
        let pickedDate = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        lblSelected.text = "Selected: \(formatter.string(from: pickedDate.date))"
        
        formatter.dateFormat = "hh:mm aaa"
        alertTime = formatter.string(from: pickedDate.date)
        
    }
    
    @objc func updateTime() {
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        lblNow.text = "Now: \(formatter.string(from: date as Date))"
        
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        
        if (alertTime == currentTime) {
            view.backgroundColor = UIColor.red
        } else {
            view.backgroundColor = UIColor.white
        }
    }
    
}


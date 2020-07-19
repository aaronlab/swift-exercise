//
//  ViewController.swift
//  DatePicker
//
//  Created by Aaron Lee on 7/18/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {
    // 타이머 구동 시 실행할 함수
    let timeSelector: Selector = #selector(DateViewController.updateTime)
    let interval = 1.0  // 간격 1초
    var count = 0       // 설정 간격대로 실행되는지 확인을 위한 변수

    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblSelectedTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 로드 됐을 때 타이머 설정
        // timeInterval: 타이머 간격, target: 동작될 view, selector: 타이머가 구동될 때 실행할 함수
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender     // sender로 부터 전달 된 인수 저장
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblSelectedTime.text = "Selected: \(formatter.string(from: datePickerView.date))"
    }
    
    // 타이머가 구동된 후 정해진 interval이 되었을 때 실행할 함수
    @objc func updateTime() {
        let date = NSDate()     // 현재 시간
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "Now: \(formatter.string(from: date as Date))"
    }
    
}


//
//  EditViewController.swift
//  Navigation
//
//  Created by Aaron Lee on 7/19/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}

class EditViewController: UIViewController {
    
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate: EditDelegate?
    var isOn = false
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swisOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swisOn.isOn = isOn
    }
    
    // 메인화면으로 텍스트와 전구 이미지 상태 보내기
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
        }
        
        // 메인 화면으로 이동하기
        _ = navigationController?.popViewController(animated: true)
    }
    
    // 전구 켜고 끄기
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
}

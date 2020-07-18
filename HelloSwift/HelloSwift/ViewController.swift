//
//  ViewController.swift
//  HelloSwift
//
//  Created by Aaron Lee on 7/18/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblHello: UILabel!       // 출력 레이블용 아웃렛 변수
    @IBOutlet weak var txtName: UITextField!    // 이름 입력용 아웃렛 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnSend(_ sender: Any) {
        // Hello, 라는 문자열과 txtName.text의 문자열을 결합하여 lblHello.txt에 넣음
        lblHello.text = "Hello, \(txtName.text!)!"
        txtName.text = ""
    }
    
}


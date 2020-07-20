//
//  ViewController.swift
//  PinchGesture
//
//  Created by Aaron Lee on 7/21/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    var initialFontSize: CGFloat!     // 글자 크기 변수
//    @IBOutlet var txtPinch: UILabel!
    
    @IBOutlet var imgPinch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIPinchGestureRecognizer 클래스 상수 pinch
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)       // 핀치 제스쳐 등록
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        // 핀치 제스처 상태 확인
//        if (pinch.state == UIGestureRecognizer.State.began) {
              // 시작 상태이면 현재 글자 크기 저장
//            initialFontSize = txtPinch.font.pointSize
//        } else {
              // 시작 상태 아니면 글자 크기 변경
//            txtPinch.font = txtPinch.font.withSize(initialFontSize * pinch.scale)
        
        // 이미지를 스케일에 맞게 변환
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        
        // 다음 핀치를 위해 핀치 스케일 속성 1로 설정
        pinch.scale = 1
//        }
    }

}


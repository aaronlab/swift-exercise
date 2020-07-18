//
//  ViewController.swift
//  ImageView
//
//  Created by Aaron Lee on 7/18/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isZoom = false      // 이미지 확대 여부
    var imgOn: UIImage?     // 켜진 전구 이미지
    var imgOff: UIImage?    // 꺼진 전구 이미지

    @IBOutlet weak var imgView: UIImageView!    // 이미지 뷰 아웃렛
    @IBOutlet weak var btnResize: UIButton!     // 버튼 아웃렛
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgOn = UIImage(named: "lamp_on.png")       // img on 할당
        imgOff = UIImage(named: "lamp_off.png")     // img off 할당
        
        imgView.image = imgOn       // 이미지를 imgView에 할당
    }
    
    // 확대 / 축소 액션
    @IBAction func btnResizeImg(_ sender: UIButton) {
        let scale: CGFloat = 2.0    // 확대 배율 값
        var newWidth: CGFloat, newHeight: CGFloat   // 확대 크기 계산 보관
        
        if (isZoom) {    // 확대된 경우
            newWidth = imgView.frame.width/scale            // 이미지뷰 가로 / 스케일
            newHeight = imgView.frame.height/scale          // 이미지뷰 세로 / 스케일
            btnResize.setTitle("Zoom In", for: .normal)     // 버튼 타이틀 변경
        } else {    // 축소된 경우
            newWidth = imgView.frame.width*scale            // 이미지뷰 가로 * 스케일
            newHeight = imgView.frame.height*scale          // 이미지뷰 세로 * 스케일
            btnResize.setTitle("Zoom Out", for: .normal)    // 버튼 타이틀 변경
        }
        // 이미지 프레임 사이즈 변경
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        
        // 연산자를 사용하여 변수 상태 반전
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {                // 스위치가 온이면
            imgView.image = imgOn       // on img
        } else {
            imgView.image = imgOff
        }
    }
}


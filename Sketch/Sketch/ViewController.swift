//
//  ViewController.swift
//  Sketch
//
//  Created by Aaron Lee on 7/20/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var lblStroke: UILabel!
    @IBOutlet var stepperStroke: UIStepper!
    
    var lastPoint: CGPoint!     // 최근 터치 or 이동한 위치
    var lineSize: CGFloat = 1.0     // 선 두께 1.0
    var lineColor = UIColor.black.cgColor     // 선 색상 검정
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stepperStroke.value = 1
        lblStroke.text = String(Int(stepperStroke.value))
    }
    
    @IBAction func clearImgView(_ sender: UIButton) {
        imgView.image = nil     // 이미지 뷰의 이미지 삭제
    }
    
    @IBAction func btnBlack(_ sender: UIButton) {
        lineColor = UIColor.black.cgColor
    }
    
    @IBAction func btnRed(_ sender: UIButton) {
        lineColor = UIColor.red.cgColor
    }
    
    @IBAction func btnGreen(_ sender: UIButton) {
        lineColor = UIColor.green.cgColor
    }
    
    
    @IBAction func btnBlue(_ sender: UIButton) {
        lineColor = UIColor.blue.cgColor
    }
    
    
    @IBAction func changeStepper(_ sender: UIStepper) {
        let newValue = sender.value
        lblStroke.text = String(Int(newValue))
        lineSize = CGFloat(newValue)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch       // 발생한 터치 이벤트 가져오기
        
        lastPoint = touch.location(in: imgView)     // 터치된 위치 대입
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)                 // 그림을 위한 콘텍스트 생성
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)        // 선 색상
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)      // 라인의 끝 모양을 라운드로 설정
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)           // 선 두께
        
        let touch = touches.first! as UITouch           // 발생한 터치 이벤트 변수
        let currPoint = touch.location(in: imgView)     // 터치된 위치 변수
        
        // 이미지 뷰에 있는 이미지를 이미지 뷰의 크기로 그림
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        
        // lastPoint로 시작 위치 이동
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        // lastPoint에서 현재 위치로 선을 추가
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        // 그려진 콘텍스트 이미지뷰에 할당
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()     // 그리기 끝
        
        lastPoint = currPoint       // 터치된 위치가 lastPoint에 할당
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {     // 흔드는 모션
            imgView.image = nil     // 이미지 뷰의 이미지 삭제
        }
    }
    
}


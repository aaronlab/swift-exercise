//
//  ViewController.swift
//  PickerViewExercise
//
//  Created by Aaron Lee on 7/18/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let NUMBER_OF_COMPONENT = 2
    let MAX_COUNT = 10
    let PICKER_VIEW_HEIGHT: CGFloat = 80
    var imageArray = [UIImage?]()
    var imageFileName = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<10 {
            let img = UIImage(named: imageFileName[i])
            imageArray.append(img)
        }
        lblItem.text = imageFileName[0]
        imageView.image = imageArray[0]
    }
    
    // 피커뷰 목록 수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    // 피커뷰 엘리먼트 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return NUMBER_OF_COMPONENT
    }
    
    // 피커뷰 엘리먼트 높이
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    // 피커뷰 이미지
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component==0) {
            lblItem.text = imageFileName[row]
        } else{
            imageView.image = imageArray[row]
        }

    }


}


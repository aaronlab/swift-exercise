//
//  ViewController.swift
//  CameraPhotoLibrary
//
//  Created by Aaron Lee on 7/20/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit
import MobileCoreServices   // 다양한 타입들을 정의해 놓은 헤더 파일 추가

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {   // 델리게이트 프로토콜 추가

    @IBOutlet var imgView: UIImageView!
    
    // 인스턴스 변수
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!  // 사진 저장할 변수
    var videoURL: URL!  // 비디오 URL 저장할 변수
    var flagImageSave = false   // 사진 저장 여부 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 사진 촬영
    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        // 카메라 사용이 된다면
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            flagImageSave = true    // 사진 저장 플래그 참
            
            imagePicker.delegate = self     // 이미지 피커 델리케이트
            imagePicker.sourceType = .camera    // 이미지 피커 소스타입
            imagePicker.mediaTypes = [kUTTypeImage as String]   // // 미디어 타입
            
            imagePicker.allowsEditing = false   //  편집 미허용
            // 뷰컨트롤러 imagePicker로 대체
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert("Can't Access", message: "Application cannot access your camera.")
        }
    }
    
    // 사진 불러오기
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            imagePicker.delegate = self
            // 소스타입 포토라이브러리
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true    // 편집 허용
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert("Can't Access", message: "Application cannot access your photolibrary.")
        }
    }
    
    // 비디오 촬영
    @IBAction func btnRecordVideoFromCamera(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            // 미디어 타입
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert("Can't Access", message: "Application cannot access your camera.")
        }
    }
    
    // 비디오 불러오기
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert("Can't Access", message: "Application cannot access your camera.")
        }
    }
    
    // 촬영 선택 끝났을 때 호출되는 델리게이트 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        // 미디어 종류 확인
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        // 사진일 경우
        if mediaType.isEqual(to: kUTTypeImage as NSString as String) {
            // 사진 호출
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            // 저장 플래그 참일 때
            if flagImageSave {
                // 사진을 포토라이브러리에 저장
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            // 가져온 이미지를 뷰에 출력
            imgView.image = captureImage
            
        // 미디어가 비디오일 때
        } else if mediaType.isEqual(to: kUTTypeMovie as NSString as String) {
            // 저장 플래그 참일 때
            if flagImageSave {
                // 비디오를 가져옴
                videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL)
                
                // 비디오를 포토 라이브러리에 저장
                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil)
            }
        }
        
        // 현재의 뷰(이미지 피커) 제거
        self.dismiss(animated: true, completion: nil)
    }
    
    // 촬영 취소했을 때 호출되는 메서드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 경고 출력 함수
    func myAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}


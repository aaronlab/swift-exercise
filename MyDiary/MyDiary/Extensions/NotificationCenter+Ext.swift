//
//  NotificationCenter+Ext.swift
//  MyDiary
//
//  Created by Aaron Lee on 2021/11/29.
//

import Foundation
import RxSwift

extension NotificationCenter {
    
    func keyboardWillHideObservable() -> Observable<CGFloat> {
        return NotificationCenter.default.rx
            .notification(UIResponder.keyboardWillHideNotification)
            .map { notification -> CGFloat in
                (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height ?? 0
            }
    }
    
    func keyboardWillChangeFrame() -> Observable<CGFloat> {
        return NotificationCenter.default.rx
            .notification(UIResponder.keyboardWillChangeFrameNotification)
            .map { notification -> CGFloat in
                (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height ?? 0
            }
    }
    
}

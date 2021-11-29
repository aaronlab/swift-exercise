//
//  UINavigationController+Ext.swift
//  MyDiary
//
//  Created by Aaron Lee on 2021/11/29.
//

import UIKit

extension UINavigationController: UIGestureRecognizerDelegate {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
}

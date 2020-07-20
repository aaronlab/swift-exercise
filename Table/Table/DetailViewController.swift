//
//  DetailViewController.swift
//  Table
//
//  Created by Aaron Lee on 7/20/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var recieveItem = ""

    @IBOutlet var lblItem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblItem.text = recieveItem
    }
    
    // Main View에서 변수를 받아오기 위한 함수
    func receiveItem(_ item: String){
        recieveItem = item
    }

}

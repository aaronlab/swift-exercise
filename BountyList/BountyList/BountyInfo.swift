//
//  BountyInfo.swift
//  BountyList
//
//  Created by Aaron Lee on 7/17/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int){
        self.name = name
        self.bounty = bounty
    }
}

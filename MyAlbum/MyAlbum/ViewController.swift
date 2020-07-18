//
//  ViewController.swift
//  MyAlbum
//
//  Created by Aaron Lee on 7/16/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 100
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
    }
    
    @IBAction func showAlert(_ sender: Any) {
        let message = "The Price is $\(currentValue)."
        let alert = UIAlertController(title: "Price", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {action in
            self.refresh()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    func refresh() {
        priceLabel.text = "$ \(currentValue)"
        let randomPrice = arc4random_uniform(1000) + 1
        currentValue = Int(randomPrice)
    }
}


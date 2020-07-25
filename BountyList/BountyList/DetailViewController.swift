//
//  DetailViewController.swift
//  BountyList
//
//  Created by Aaron Lee on 7/25/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    /*
    MVVM
    
    # Model
       - Bounty Info
       - Make the Bounty Info
    # View
       - ImgView, namdLabel, bountyLabel
       - each view is composed by viewModel
    # ViewModel
     - DetailViewModel
     - Make Methods
       - Has to have the model, such as BountyInfo
    */

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
//    var name: String?
//    var bounty: Int?
    var bountyInfo: BountyInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        if let bountyInfo = self.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name.uppercased()
            bountyLabel.text = "$ \(bountyInfo.bounty)"
        }
        
//        if let name = self.bountyInfo.name, let bounty = self.bountyInfo.bounty {
//            let img = UIImage(named: "\(name).jpg")
//            imgView.image = img
//            nameLabel.text = name.uppercased()
//            bountyLabel.text = "$ \(bounty)"
//        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

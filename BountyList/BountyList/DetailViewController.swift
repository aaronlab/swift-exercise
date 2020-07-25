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
    
    var viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        if let bountyInfo = self.viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name.uppercased()
            bountyLabel.text = "$ \(bountyInfo.bounty)"
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}

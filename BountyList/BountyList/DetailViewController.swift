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
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    
    var viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    private func prepareAnimation() {
        nameLabelCenterX.constant = view.bounds.width
        bountyLabelCenterX.constant = view.bounds.width
    }
    
    private func showAnimation() {
        nameLabelCenterX.constant = 0
        bountyLabelCenterX.constant = 0
        
        UIView.animate(withDuration: 0.5, delay: 0.2,
                       usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction,
                       animations: { self.view.layoutIfNeeded() }, completion: nil)
        
        UIView.transition(with: imgView, duration: 0.3,
                          options: .transitionFlipFromLeft, animations: nil, completion: nil)
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
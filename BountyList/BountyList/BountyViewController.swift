//
//  BountyViewController.swift
//  BountyList
//
//  Created by Aaron Lee on 7/25/20.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /*
     MVVM
     
     # Model
        - Bounty Info
        - Make the Bounty Info
     # View
        - ListCell
        - Get the Info from ViewModel
        - Update View with the Info
     # ViewModel
        - BountyViewModel
        - Make BountyViewModel, Make Methods for ViewLayer
        - Has to have the model, such as BountyInfo
     */
    
    // name, bounty list
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
//    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
//    let bountyList = [33000000, 50, 44000000, 300000000, 16000000, 80000000, 77000000, 120000000]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // send data to detailViewController
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                let bountyInfo = bountyInfoList[index]
                
                vc?.bountyInfo = bountyInfo
                
//                vc?.name = bountyInfo.name
//                vc?.bounty = bountyInfo.bounty
//                vc?.name = nameList[index]
//                vc?.bounty = bountyList[index]
            }
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyInfoList.count
//        return nameList.count
    }
    
    // what cell will be shown?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
//        let img = UIImage(named: "\(bountyInfoList[indexPath.row].name).jpg")
        cell.imgView.image = bountyInfoList[indexPath.row].image
        cell.nameLable.text = bountyInfoList[indexPath.row].name.uppercased()
        cell.bountyLabel.text = "$ \(bountyInfoList[indexPath.row].bounty)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // perform segue, when you tab on a cell
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}

struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}

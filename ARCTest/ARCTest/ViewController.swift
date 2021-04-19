//
//  ViewController.swift
//  ARCTest
//
//  Created by Aaron Lee on 2021/04/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    deinit {
        print("View Controller is being deinitialized")
    }
    
    @IBAction func showNext(_ sender: Any) {
        let vc = ChildViewController()
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true, completion: nil)
        
    }

}

class ChildViewController: UIViewController {
    
    var word = ""
    var anotherWord = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        Singleton.shared.myFunction(word: "hello") { word in
            self.word = word
            print(word)
        }
        
        anotherFunction(word: "Hello2") { word in
            self.anotherWord = word
            print(self.anotherWord)
        }
        
    }
    
    func anotherFunction(word: String, completion: @escaping (String) -> Void) {
        completion(word)
    }

    deinit {
        print("Child View Controller is being deinitialized")
        print(word)
        print(anotherWord)
    }

}

struct Singleton {

    static let shared = Singleton()
    
    private init() { }
    
    func myFunction(word: String, completion: @escaping (String) -> Void) {
        completion(word)
    }

}

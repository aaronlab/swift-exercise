//
//  ViewController.swift
//  PageControlExercise
//
//  Created by Aaron Lee on 7/19/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblPageNum: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblPageNum.text = "1"
        
        pageControl.numberOfPages = 10
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
    }
    
    
    @IBAction func changePage(_ sender: UIPageControl) {
        lblPageNum.text = String(pageControl.currentPage + 1)
    }
    

}


//
//  ViewController.swift
//  PageControl
//
//  Created by Aaron Lee on 7/19/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // number of pageCtrl
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0     // init page = 0
        
        // page indicator color
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        
        // current page indicator color
        pageControl.currentPageIndicatorTintColor = UIColor.black
        
        imgView.image = UIImage(named: images[0])
    }
    
    // when the page changed
    @IBAction func pageChange(_ sender: UIPageControl) {
        // image change
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
}


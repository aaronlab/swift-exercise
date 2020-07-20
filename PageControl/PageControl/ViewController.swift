//
//  ViewController.swift
//  PageControl
//
//  Created by Aaron Lee on 7/19/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let MIN_PAGE_NUM: Int = 0
    let MAX_PAGE_NUM: Int = 5
    
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
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
        
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        imgView.transform = imgView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.left:
                    if (pageControl.currentPage == MAX_PAGE_NUM) {
                        pageControl.currentPage = MIN_PAGE_NUM
                    } else {
                        pageControl.currentPage += 1
                    }
                case UISwipeGestureRecognizer.Direction.right:
                    if (pageControl.currentPage == MIN_PAGE_NUM) {
                        pageControl.currentPage = MAX_PAGE_NUM
                    } else {
                        pageControl.currentPage -= 1
                    }
                default:
                    break
            }
            imgView.image = UIImage(named: images[pageControl.currentPage])
        }
    }
    
    // when the page changed
    @IBAction func pageChange(_ sender: UIPageControl) {
        // image change
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
}


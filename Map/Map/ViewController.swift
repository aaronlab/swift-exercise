//
//  ViewController.swift
//  Map
//
//  Created by Aaron Lee on 7/19/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        
        locationManager.delegate = self
        // accuracy best
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 위치정보 승인 요청
        locationManager.requestWhenInUseAuthorization()
        // start updating
        locationManager.startUpdatingLocation()
        
        myMap.showsUserLocation = true  // 위치 보기 값 true
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        
        myMap.setRegion(pRegion, animated: true)
        
        return pLocation
    }
    
    // make a pin on a particular location
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span :Double, title strTitle: String, subtitle strSubtitle:String){
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        
        myMap.addAnnotation(annotation)
    }
    
    // extract country, locality, throughfare and show it in labels
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            
            let country = pm!.country
            var address:String = country!
            
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "Current Location"
            self.lblLocationInfo2.text = address
            
        })
        
        locationManager.stopUpdatingLocation()
    }

    // when users use sgControl
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // show current location
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            
            locationManager.startUpdatingLocation()
        } else if sender.selectedSegmentIndex == 1 {
            // show Lyon
            self.lblLocationInfo1.text = "What you're looking for is"
            self.lblLocationInfo2.text = "Lyon City Hall, France"
            
            setAnnotation(latitudeValue: 45.767842, longitudeValue: 4.835666, delta: 0.01, title: "Lyon City Hall", subtitle: "France")
        } else if sender.selectedSegmentIndex == 2{
            // show Toronto
            self.lblLocationInfo1.text = "What you're looking for is"
            self.lblLocationInfo2.text = "Toronto City Hall, ON, Canada"
            
            setAnnotation(latitudeValue: 43.653471, longitudeValue: -79.384079, delta: 0.01, title: "Toronto City Hall", subtitle: "ON, Canada")
        } else if sender.selectedSegmentIndex == 3{
            // show my place
            self.lblLocationInfo1.text = "My place is here:"
            self.lblLocationInfo2.text = "The White House, Washington, DC, United States"
            
            setAnnotation(latitudeValue: 38.897676, longitudeValue: -77.036530, delta: 0.01, title: "The White House", subtitle: "Washington, DC, United States")
        }
    }
    
}


//
//  MapViewController.swift
//  SDSC-Wifire
//
//  Created by Eric Fakhourian on 4/25/17.
//  Copyright © 2017 Eric Fakhourian. All rights reserved.
//  
//  This is extra map view controller if you want to open just the map from the taking picture page and see the 
// big picture of the location of you. 

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    let locationManger = CLLocationManager()
    let reagionRadius:CLLocationDistance = 1000

    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        
        map.showsUserLocation = true
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        locationAuthStatus()
    }

    
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func locationAuthStatus() {
        //while user is using the app.
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            map.showsUserLocation = true
        } else {
            locationManger.requestWhenInUseAuthorization()
        }
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, reagionRadius * 2, reagionRadius * 2)
        map.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        if let loc = userLocation.location {
            centerMapOnLocation(location: loc)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

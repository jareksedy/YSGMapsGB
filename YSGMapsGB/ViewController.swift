//
//  ViewController.swift
//  YSGMapsGB
//
//  Created by Ярослав on 08.03.2022.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: GMSMapView!
    
    private func configureMap() {
        let coordinate = CLLocationCoordinate2D(latitude: 43.238949, longitude: 76.889709)
        let camera = GMSCameraPosition.camera(withTarget: coordinate, zoom: 15)
        mapView.camera = camera
    }
    
    private func configureLocationManager() {
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
    }
    
    @IBAction func updateLocation(_ sender: Any) {
    }
    
    @IBAction func currentLocation(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMap()
        configureLocationManager()
    }

}


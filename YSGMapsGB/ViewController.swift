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
    let locationManager = CLLocationManager()
    let coordinates: [CLLocationCoordinate2D] = []
    let zoomValue: Float = 25
    
    @IBOutlet weak var mapView: GMSMapView!
    
    private func addMarker(position: CLLocationCoordinate2D) {
        let marker = GMSMarker(position: position)
        marker.map = mapView
    }
    
    private func configureLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.first?.coordinate {
            let camera = GMSCameraPosition.camera(withTarget: coordinate, zoom: zoomValue)
            mapView.camera = camera
            addMarker(position: coordinate)
            
            let path = GMSMutablePath()
            path.add(coordinate)
            
            let route = GMSPolyline(path: path)
            route.map = mapView
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocationManager()
    }

}


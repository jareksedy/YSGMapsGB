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
    let zoomValue: Float = 18
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var locationButton: UIButton!
    
    private func addMarker(position: CLLocationCoordinate2D) {
        let marker = GMSMarker(position: position)
        marker.map = mapView
    }
    
    private func configureMap() {
        let coordinate = CLLocationCoordinate2D(latitude: 43.238949, longitude: 76.889709)
        let camera = GMSCameraPosition.camera(withTarget: coordinate, zoom: zoomValue)
        mapView.camera = camera
    }
    
    private func configureLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func locationButtonTapped(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.first?.coordinate {
            let camera = GMSCameraPosition.camera(withTarget: coordinate, zoom: zoomValue)
            mapView.camera = camera
            addMarker(position: coordinate)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //configureMap()
        configureLocationManager()
    }

}


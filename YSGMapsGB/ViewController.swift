//
//  ViewController.swift
//  YSGMapsGB
//
//  Created by Ярослав on 08.03.2022.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    @IBOutlet weak var mapView: GMSMapView!
    
    private func configureMap() {
        let coordinate = CLLocationCoordinate2D(latitude: 43.238949, longitude: 76.889709)
        let camera = GMSCameraPosition.camera(withTarget: coordinate, zoom: 15)
        mapView.camera = camera
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMap()
    }

}


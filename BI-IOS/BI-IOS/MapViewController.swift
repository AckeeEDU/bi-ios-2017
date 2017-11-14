//
//  MapViewController.swift
//  BI-IOS
//
//  Created by Jan Misar on 14.11.17.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    weak var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
    override func loadView() {
        super.loadView()
        
        let mapView = MKMapView()
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        self.mapView = mapView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            mapView.showsUserLocation = true
            mapView.userTrackingMode = .follow
        }
    }
    
}







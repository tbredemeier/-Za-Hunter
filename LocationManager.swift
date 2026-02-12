//
//  LocationManager.swift
//  'Za Hunter
//
//  Created by Tom Bredemeier on 2/12/26.
//

import Foundation
import CoreLocation

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}





//
//  CustomLocationManager.swift
//  CrossOverAssignment
//
//  Created by Pranay on 6/4/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

import UIKit
import MapKit

protocol LocationUpdateProtocol {
    func locationDidUpdateToLocation(location : CLLocation)
}

/// Notification on update of location. UserInfo contains CLLocation for key "location"
let kLocationDidChangeNotification = "LocationDidChangeNotification"

class CustomLocationManager: NSObject, CLLocationManagerDelegate {
    
    static let SharedManager = CustomLocationManager()
    
    private var locationManager = CLLocationManager()
    
    var currentLocation : CLLocation?
    
    var delegate : LocationUpdateProtocol!
    
    private override init () {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLLocationAccuracyHundredMeters
        locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        currentLocation = newLocation
    }
}

//
//  LocationService.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/17/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import CoreLocation

protocol LocationServiceDelegate{
    func locationAuthorizeChanged()
}
class LocationService: NSObject, LocationServiceProtocol{

    static var shared: LocationServiceProtocol = LocationService()
    
    var delegate: LocationServiceDelegate?
    
    private let locationManager = CLLocationManager()

    func isLocationServiceEnabled() -> Bool{
        return CLLocationManager.locationServicesEnabled()
    }
    func isLocationGranted() -> Bool {
        switch CLLocationManager.authorizationStatus(){
        case .denied:
            return false
        case .restricted, .notDetermined:
            return false
        default:
            return true
        }
    }
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 35 // metres
        locationManager.allowsBackgroundLocationUpdates = true
    }
    
    func request(){
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
    }

}
extension LocationService: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        manager.stopUpdatingHeading()
    }
    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        manager.stopMonitoringVisits()
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            delegate?.locationAuthorizeChanged()
    }
}

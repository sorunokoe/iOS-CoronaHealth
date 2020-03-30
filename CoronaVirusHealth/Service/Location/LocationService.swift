//
//  LocationService.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/17/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import CoreLocation
import NotificationCenter

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
        
//        let trigger = UNLocationNotificationTrigger(triggerWithRegion: region, repeats:false)
//        
//        CLCircularRegion(center: <#T##CLLocationCoordinate2D#>, radius: <#T##CLLocationDistance#>, identifier: <#T##String#>)
//        let region = CLRegion()
//        region.notifyOnEntry = true
//        region.notifyOnExit = true
//        
//        UNLocationNotificationTrigger(region: <#T##CLRegion#>, repeats: <#T##Bool#>)
        
        manager.stopUpdatingHeading()
    }
    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        manager.stopMonitoringVisits()
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            delegate?.locationAuthorizeChanged()
    }
}

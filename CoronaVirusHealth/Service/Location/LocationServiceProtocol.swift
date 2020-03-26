//
//  LocationServiceProtocol.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/17/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationServiceProtocol{
    var delegate: LocationServiceDelegate? { get set }
    func isLocationServiceEnabled() -> Bool
    func isLocationGranted() -> Bool
    func request()
    
}

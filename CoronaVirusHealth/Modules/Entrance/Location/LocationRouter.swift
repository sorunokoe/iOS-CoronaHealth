//
//  LocationRouter.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/18/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import Foundation
import Swinject

class LocationRouter{
    
    static func generate() -> LocationViewControllerProtocol{
        let container = Container()
        container.register(LocationServiceProtocol.self) { _ in
            LocationService()
        }
        container.register(LocationView.self) { _ in
            LocationView()
        }
        container.register(LocationViewControllerProtocol.self) { (r) in
            return LocationViewController(
                contentView: r.resolve(LocationView.self)!)
        }
        return container.resolve(LocationViewControllerProtocol.self)!
    }
    
}

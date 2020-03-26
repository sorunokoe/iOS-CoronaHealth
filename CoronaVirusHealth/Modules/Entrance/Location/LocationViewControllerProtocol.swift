//
//  LocationViewControllerProtocol.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/17/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import Foundation

protocol LocationViewControllerProtocol{
    var contentView: LocationView { get set }
    var delegate: LocationViewControllerDelegate? { get set }
}

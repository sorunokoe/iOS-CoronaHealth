//
//  InformationViewControllerProtocol.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/18/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import Foundation


protocol InformationViewControllerProtocol{
    var contentView: InformationView { get set }
    var delegate: InformationViewControllerDelegate? { get set }
}

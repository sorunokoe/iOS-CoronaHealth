//
//  EntranceProtocol.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/17/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import Foundation

enum EntranceRouterTarget{
    case main
}
protocol EntranceRouterProtocol{
    func nav(to: EntranceRouterTarget)
}
protocol EntranceViewControllerProtocol{
    var router: EntranceRouterProtocol? { get set }
}


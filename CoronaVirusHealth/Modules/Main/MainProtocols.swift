//
//  MainProtocols.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/18/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

enum MainRouterTarget{
    case diagnosticDetail
}
protocol MainRouterProtocol{
    var viewController: UIViewController?{ get set }
    func nav(to: MainRouterTarget)
}
protocol MainViewControllerProtocol{
    var router: MainRouterProtocol { get set }
}

//
//  DiagnosticProtocols.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/18/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit
enum DiagnosticRouterTarget{
    case diagnosticDetail
}
protocol DiagnosticRouterProtocol {
    var viewController: UIViewController?{ get set }
    func nav(to: DiagnosticRouterTarget)
}
protocol DiagnosticViewControllerProtocol{
    var router: DiagnosticRouterProtocol { get set }
}

//
//  EntranceRouter.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/17/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit
import Swinject

class EntranceRouter: EntranceRouterProtocol{
    
    private static var viewController: UIViewController?
    
    static func generate() -> UIViewController{
        let container = Container()
        container.register(EntranceRouterProtocol.self) { _ in
            EntranceRouter()
        }
        container.register(EntranceViewControllerProtocol.self) { (r) in
            let vc = EntranceViewController()
            vc.router = r.resolve(EntranceRouterProtocol.self)!
            return vc
        }
        let vc = container.resolve(EntranceViewControllerProtocol.self) as! UIViewController
        self.viewController = vc
        return vc
    }
    
    func nav(to: EntranceRouterTarget) {
        switch to{
        case .main:
            TabRouter.shared.navigate(to: .main)
        }
    }
    
}

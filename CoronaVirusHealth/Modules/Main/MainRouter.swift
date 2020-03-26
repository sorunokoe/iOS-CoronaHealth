//
//  MainRouter.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/18/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import Foundation
import Swinject

class MainRouter: MainRouterProtocol{
    
    var viewController: UIViewController?

    static func generate() -> UIViewController{
        let container = Container()
        container.register(MainRouter.self) { (_) in
            MainRouter()
        }
        container.register(PreventionDataSource.self) { (_) in
            PreventionDataSource()
        }
        container.register(MainViewDataSource.self) { (r) in
            MainViewDataSource(preventionDataSource: r.resolve(PreventionDataSource.self)!)
        }
        container.register(MainView.self) { (r) in
            MainView(frame: .zero, dataSource: r.resolve(MainViewDataSource.self)!)
        }
        container.register(MainViewControllerProtocol.self) { (r) in
            let router = r.resolve(MainRouter.self)!
            let vc = MainViewController(contentView: r.resolve(MainView.self)!, router: router)
            router.viewController = vc
            return vc
        }
        let vc = container.resolve(MainViewControllerProtocol.self) as! UIViewController
        return NavigationViewController(rootViewController: vc)
    }
    
    func nav(to: MainRouterTarget) {
        switch to{
        case .diagnosticDetail:
            let vc = DiagnosticRouter.generate()
            self.viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

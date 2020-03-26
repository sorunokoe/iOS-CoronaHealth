//
//  DiagnosticRouter.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/18/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit
import Swinject

class DiagnosticRouter: DiagnosticRouterProtocol{
    
    var viewController: UIViewController?
    
    static func generate() -> UIViewController{
        let container = Container()
        container.register(CacheServer.self) { (_) in
            CacheServer()
        }
        container.register(DiagnosticRouterProtocol.self) { (_) in
            DiagnosticRouter()
        }
        container.register(DiagnosticViewDataSource.self) { (_) in
            DiagnosticViewDataSource()
        }
        container.register(DiagnosticView.self) { (r) in
            DiagnosticView(frame: .zero, dataSource: r.resolve(DiagnosticViewDataSource.self)!)
        }
        container.register(DiagnosticViewControllerProtocol.self) { (r) in
            let vc = DiagnosticViewController(contentView: r.resolve(DiagnosticView.self)!,
                                              router: r.resolve(DiagnosticRouterProtocol.self)!,
                                              database: r.resolve(CacheServer.self)!)
            vc.router.viewController = vc
            return vc
        }
        let vc = container.resolve(DiagnosticViewControllerProtocol.self) as! UIViewController
        return NavigationViewController(rootViewController: vc)
    }

    func nav(to: DiagnosticRouterTarget) {
        switch to{
        case .diagnosticDetail:
            let vc = DiagnosticDetailRouter.generate()
            self.viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


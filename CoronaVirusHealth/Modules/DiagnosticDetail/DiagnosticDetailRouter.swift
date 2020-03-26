//
//  DiagnosticDetailRouter.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/21/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import Foundation
import Swinject

class DiagnosticDetailRouter{
    
    private static var viewController: UIViewController?
    
    static func generate() -> UIViewController{
        let container = Container()
        container.register(CacheServer.self) { (_) in
            CacheServer()
        }
        container.register(DiagnosticDetailDataSource.self) { (_) in
            DiagnosticDetailDataSource()
        }
        container.register(DiagnosticDetailView.self) { (r) in
            DiagnosticDetailView(frame: .zero, dataSource: r.resolve(DiagnosticDetailDataSource.self)!)
        }
        container.register(DiagnosticDetailViewControllerProtocol.self) { (r) in
            DiagnosticDetailViewController(contentView: r.resolve(DiagnosticDetailView.self)!,
                                           storageService: r.resolve(CacheServer.self)!)
        }
        let vc = container.resolve(DiagnosticDetailViewControllerProtocol.self) as! UIViewController
        return vc
    }
    
}

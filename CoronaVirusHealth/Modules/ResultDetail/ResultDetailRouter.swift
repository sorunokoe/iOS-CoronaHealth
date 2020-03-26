//
//  ResultDetailRouter.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/24/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit
import Swinject

class ResultDetailRouter: ResultDetailRouterProtocol{

    static func generate(with result: DiagnosticResultModel) -> UIViewController{
        let container = Container()
        container.register(CacheServer.self) { (r) in
            CacheServer()
        }
        container.register(ResultDetailView.self) { (r) in
            ResultDetailView()
        }
        container.register(ResultDetailViewControllerProtocol.self) { (r) in
            ResultDetailViewController(contentView: r.resolve(ResultDetailView.self)!,
                                       result: result,
                                       storageService: r.resolve(CacheServer.self)!)
        }
        let vc = container.resolve(ResultDetailViewControllerProtocol.self) as! UIViewController
        return vc
    }
    
}

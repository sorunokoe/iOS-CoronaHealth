//
//  InformationRouter.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/18/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import Foundation
import Swinject

class InformationRouter{
    
    static func generate() -> InformationViewControllerProtocol{
        let container = Container()
        container.register(InformationDataSource.self) { _ in
            InformationDataSource()
        }
        container.register(InformationView.self) { (r) in
            InformationView(frame: .zero, dataSource: r.resolve(InformationDataSource.self)!)
        }
        container.register(InformationViewControllerProtocol.self) { (r) in
            InformationViewController(contentView: r.resolve(InformationView.self)!)
        }
        return container.resolve(InformationViewControllerProtocol.self)!
    }
    
    
}

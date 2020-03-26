//
//  WorldRouter.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/18/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import Foundation
import Swinject

class WorldRouter{
    
    static func generate() -> UIViewController{
        let container = Container()
        container.register(WorldView.self) { (r) in
            WorldView()
        }
        container.register(WorldViewControllerProtocol.self) { (r) in
            WorldViewController(contentView: r.resolve(WorldView.self)!)
        }
        let vc = container.resolve(WorldViewControllerProtocol.self) as! UIViewController
        return NavigationViewController(rootViewController: vc)
    }
    
}

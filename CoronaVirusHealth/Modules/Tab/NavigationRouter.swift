//
//  NavigationRouter.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/18/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

class TabRouter{
    enum NavigationTarget {
        case entrance
        case main
    }
    static var shared = TabRouter()
    private var window: UIWindow!
    
    
    func configure(window: UIWindow){
        self.window = window
        self.window.makeKeyAndVisible()
        navigate(to: .entrance)
    }
    
    func navigate(to: NavigationTarget){
        switch to{
        case .entrance:
            window.rootViewController = EntranceRouter.generate()
        case .main:
            window.rootViewController = TabViewController()
        }
        window.makeKeyAndVisible()
    }
    
    
}

//
//  App.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/17/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import Foundation

class App{
    static var shared = App()
    private var databaseConfig: RealmConfiguration?
    
    init(){
        databaseConfig = RealmConfiguration()
    }
    func configure(){
        databaseConfig?.configure()
    }
    func clear(){
        databaseConfig?.clearDB()
    }
}

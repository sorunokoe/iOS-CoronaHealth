//
//  RealmConfiguration.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/25/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//


import Foundation
import RealmSwift

class RealmConfiguration{
    
    func configure(){
        let config = Realm.Configuration(
            schemaVersion: 5,
            migrationBlock: { _, _ in
                
            })
        Realm.Configuration.defaultConfiguration = config
        _ = try? Realm()
    }
    
    func clearDB(){
        let realm = try? Realm()
        try? realm?.write {
            realm?.deleteAll()
        }
    }
    
}

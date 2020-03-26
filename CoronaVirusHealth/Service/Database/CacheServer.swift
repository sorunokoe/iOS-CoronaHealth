//
//  CacheServer.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/25/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import Foundation
import RealmSwift

enum CacheServerKey: String{
    case totalResult
}

class CacheServer{
    
    private let realm = try! Realm()
    private let storage = UserDefaults.standard
    
    func set(_ object: DiagnosticResultModelObject, key: CacheServerKey) {
        try! realm.write {
            realm.add(object)
        }
    }
    
    func get(_ key: CacheServerKey) -> [DiagnosticResultModel] {
        var objects: [DiagnosticResultModel] = []
        for object in realm.objects(DiagnosticResultModelObject.self){
            objects.append(DiagnosticResultModel(object: object))
        }
        return objects
    }
    
}

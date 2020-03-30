//
//  DiagnosticResultModel.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/19/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import Foundation
import RealmSwift

struct ResultModel{
    var title: String
    var value: String
    
    init(title: String, value: String){
        self.title = title
        self.value = value
    }
    
    init(object: ResultModelObject){
        self.title = object.title
        self.value = object.value
    }
    
    func object() -> ResultModelObject{
        let object = ResultModelObject()
        object.title = title
        object.value = value
        return object
    }
}
class ResultModelObject: Object{
    @objc dynamic var title: String = ""
    @objc dynamic var value: String = ""
}
struct DiagnosticResultModel{
    var date: String
    var data: [ResultModel]
    var symptomes: [String]
    var injectionChance: Int
    
    init(date: String, data: [ResultModel], symptomes: [String], injectionChance: Int){
        self.date = date
        self.data = data
        self.symptomes = symptomes
        self.injectionChance = injectionChance
    }
    
    init(object: DiagnosticResultModelObject){
        self.date = object.date
        var data: [ResultModel] = []
        object.data.forEach{
            data.append(ResultModel(object: $0))
        }
        self.data = data
        var symptomes: [String] = []
        object.symptomes.forEach{
            symptomes.append($0)
        }
        self.symptomes = symptomes
        self.injectionChance = object.injectionChance
    }
    
    func object() -> DiagnosticResultModelObject{
        let object = DiagnosticResultModelObject()
        object.date = date
        let data = List<ResultModelObject>()
        self.data.forEach{
            data.append($0.object())
        }
        object.data = data
        let symptomes = List<String>()
        self.symptomes.forEach{
            symptomes.append($0)
        }
        object.symptomes = symptomes
        object.injectionChance = injectionChance
        return object
    }
}
class DiagnosticResultModelObject: Object {
    @objc dynamic var date: String = ""
    var data = List<ResultModelObject>()
    var symptomes = List<String>()
    @objc dynamic var injectionChance: Int = 0
}

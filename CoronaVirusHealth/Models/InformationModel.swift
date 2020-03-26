//
//  InformationModel.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/18/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import Foundation


struct InformationModel{
    
    enum QuestionType{
        case field
        case options
    }
    
    var type: QuestionType = .field
    
    var title: String
    var value: String
    var list: [String]? = nil
    var fieldType: FieldViewCollectionCell.FieldType
    
    var options: [OptionModel]?
    
    
}

//
//  Symptomes.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/30/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import Foundation

struct DiagnosticSymptomes{
    
    static var allSymptomes: [Symptomes]{
        return [.fever, .dryCough, .fatigue, .sputum_production, .shortness_of_breath, .muscle_or_joint_pain, .sore_throat, .headache, .chills]
    }
    
    enum Symptomes{
        case fever
        case dryCough
        case fatigue
        case sputum_production
        case shortness_of_breath
        case muscle_or_joint_pain
        case sore_throat
        case headache
        case chills
        
        
        
        // MARK: - Source: https://en.wikipedia.org/wiki/Coronavirus_disease_2019
        var chance: Double{
            switch self{
            case .fever: return 87.9
            case .dryCough: return 67.7
            case .fatigue: return 38.1
            case .sputum_production: return 33.4
            case .shortness_of_breath: return 18.6
            case .muscle_or_joint_pain: return 14.8
            case .sore_throat: return 13.9
            case .headache: return 13.6
            case .chills: return 11.4
            }
        }
        
        var title: String{
            switch self{
            case .fever: return "Fever"
            case .dryCough: return "Dry cough"
            case .fatigue: return "Fatigue"
            case .sputum_production: return "Sputum production"
            case .shortness_of_breath: return "Shortness of breath"
            case .muscle_or_joint_pain: return "Muscle or joint pain"
            case .sore_throat: return "Sore throat"
            case .headache: return "Headache"
            case .chills: return "Chills"
            }
        }
        
    }
}

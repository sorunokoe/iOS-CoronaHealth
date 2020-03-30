//
//  DiagnosticService.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/30/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import Foundation

protocol DiagnosticServiceProtocol{
    func getChanceOfInjection(symptomes: [DiagnosticSymptomes.Symptomes]) -> Int
}
class DiagnosticService: DiagnosticServiceProtocol{
    
    func getChanceOfInjection(symptomes: [DiagnosticSymptomes.Symptomes]) -> Int{
        var result = 0.0
        var sum = 0.0
        DiagnosticSymptomes.allSymptomes.forEach{
            sum += $0.chance
        }
        symptomes.forEach{
            result += $0.chance/sum
        }
        return Int(result*100.0)
    }
    
}

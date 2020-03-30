//
//  String+Extension.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/25/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import Foundation

extension String{
    
    func convert(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM HH:mm:ss"
        return dateFormatter.string(from: date)
    }
    
}

//
//  UIButton+Extension.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/17/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

extension UIButton{
    
    enum Style{
        case black
    }
    func set(style: Style){
        self.layer.cornerRadius = 20
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        self.titleLabel?.textColor = Colors.white.color
        self.backgroundColor = Colors.black.color
    }
    
}

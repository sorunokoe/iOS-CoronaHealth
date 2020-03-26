//
//  UIAlertController+Extension.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/20/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

extension UIAlertController {
  
  private static let sourceKey = "contentViewController"
  
  var source: Any? { return value(forKey: UIAlertController.sourceKey) }
  
  static let sheetHorizontalPaddings: CGFloat = 8.0 * 2.0
  
  convenience init(source: UIViewController?) {
    self.init(title: nil, message: nil, preferredStyle: .actionSheet)
    
    if let strongSource = source {
      setValue(strongSource, forKey: UIAlertController.sourceKey)
    }
    
    let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    addAction(cancel)
  }

}

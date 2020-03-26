//
//  TransitionDelegate.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/20/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

class TransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presenting: presenting)
    }
}

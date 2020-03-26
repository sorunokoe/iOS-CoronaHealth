//
//  PopupInformationViewController.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/20/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

class PopupInformationViewController: UIViewController{
    
    var contentView: PopupInformationView!
    private var customTransitioningDelegate = TransitioningDelegate()

    init(contentView: PopupInformationView) {
        super.init(nibName: nil, bundle: nil)
        self.contentView = contentView
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func loadView() {
        super.loadView()
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentView.delegate = self
    }
    
}
extension PopupInformationViewController: PopupInformationViewDelegate{
    func open(link: String) {
        UIApplication.shared.open(URL(string: link)!, options: [:], completionHandler: nil)
    }
}

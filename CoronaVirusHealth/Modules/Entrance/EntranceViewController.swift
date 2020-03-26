//
//  EntranceViewController.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/17/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import Swinject
import UIKit
import SnapKit

class EntranceViewController: UIViewController, EntranceViewControllerProtocol{
    
    private var child: [UIViewController] = []
    
    var contentView: EntranceView!
    var router: EntranceRouterProtocol?
    var locationViewController: LocationViewControllerProtocol!
    var informationViewController: InformationViewControllerProtocol!
    
    override func loadView() {
        super.loadView()
        contentView = EntranceView()
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
}
private extension EntranceViewController{
    enum EntranceViews{
        case location
        case information
    }
    func configureUI(){
        self.view.backgroundColor = Colors.background.color
    }
}
private extension EntranceViewController{
    func animate(){
        UIView.animate(withDuration: 2.5, animations: {
            self.contentView.transform()
        }) { (_) in
            self.showNextView()
        }
    }
    func showNextView(){
        if LocationService.shared.isLocationGranted(){
            show(view: .information)
        }else{
            show(view: .location)
        }
    }
    
    func show(view: EntranceViews){
        child.forEach {
            $0.view.isHidden = true
            $0.removeFromParent()
            $0.view.removeFromSuperview()
            $0.view.removeConstraints($0.view.constraints)
        }
        switch view {
        case .location:
            showLocationViewController()
        case .information:
            showInformationViewController()
        }
    }
    
    func showInformationViewController(){
        informationViewController = InformationRouter.generate()
        informationViewController.delegate = self
        guard let vc = informationViewController as? UIViewController else { return }
        self.addChild(vc)
        self.contentView.addSubview(vc.view)
        vc.view.isHidden = false
        vc.view.snp.makeConstraints {
            $0.top.equalTo(self.contentView.logoImageView.snp.bottom).offset(10)
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        self.didMove(toParent: vc)
        child.append(vc)
    }
    func showLocationViewController(){
        locationViewController = LocationRouter.generate()
        locationViewController.delegate = self
        guard let vc = locationViewController as? UIViewController else { return }
        self.addChild(vc)
        self.contentView.addSubview(vc.view)
        vc.view.isHidden = false
        vc.view.snp.makeConstraints {
            $0.top.equalTo(self.contentView.logoImageView.snp.bottom).offset(10)
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        self.didMove(toParent: vc)
        child.append(vc)
    }
}
extension EntranceViewController: LocationViewControllerDelegate{
    func loactionGranted() {
        show(view: .information)
    }
}
extension EntranceViewController: InformationViewControllerDelegate{
    func nextTouched() {
        router?.nav(to: .main)
    }
}

//
//  NavigationViewController.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/26/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController{
    
    var logoViewImage: UIImageView!
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
private extension NavigationViewController{
    func configureUI(){
        
        let height: CGFloat = 60
        let bounds = self.navigationBar.bounds
        self.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
        
        
        logoViewImage = UIImageView()
        logoViewImage.contentMode = .scaleAspectFit
        logoViewImage.image = UIImage(named: "big-logo")
        
        self.navigationBar.addSubview(logoViewImage)
        
        logoViewImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(38)
            $0.height.equalTo(38)
        }
    }
}


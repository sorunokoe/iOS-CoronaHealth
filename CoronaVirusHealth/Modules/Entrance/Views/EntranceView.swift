//
//  EntranceView.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/17/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit
import SnapKit

class EntranceView: UIView{
    
    var logoImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func transform(){
        self.logoImageView.snp.updateConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
        self.logoImageView.transform = CGAffineTransform(rotationAngle: 3)
        self.layoutIfNeeded()
    }
        
}
private extension EntranceView{
    func configureUI(){
        setViews()
        addViews()
        setConstraints()
    }
    func setViews(){
        logoImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "big-logo")
            return imageView
        }()
        
    }
    func addViews(){
        [logoImageView].forEach{
            self.addSubview($0)
        }
    }
    func setConstraints(){
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(200)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(240)
            $0.height.equalTo(240)
        }
    }
}

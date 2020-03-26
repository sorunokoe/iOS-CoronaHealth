//
//  LocationView.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/17/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit
import SnapKit

class LocationView: UIView{

    var descriptionLabel: UILabel!
    var enableLocationButton: UIButton!
    var privacyRulesUIButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
private extension LocationView{
    func configureUI(){
        setViews()
        addViews()
        setConstraints()
    }
    func setViews(){
        descriptionLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            label.text = NSLocalizedString("We need your location to give information that relates to you", comment: "")
            label.textAlignment = .center
            label.numberOfLines = 0
            return label
        }()
        enableLocationButton = {
            let button = UIButton()
            button.set(style: .black)
            button.setTitle(NSLocalizedString("Enable location", comment: ""), for: .normal)
            return button
        }()
        privacyRulesUIButton = {
            let button = UIButton()
            button.backgroundColor = .clear
            button.setTitle(NSLocalizedString("Privacy & rules", comment: ""), for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            return button
        }()
    }
    func addViews(){
        [descriptionLabel, enableLocationButton, privacyRulesUIButton].forEach{
            self.addSubview($0)
        }
    }
    func setConstraints(){
        descriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(50)
            $0.right.equalToSuperview().offset(-50)
        }
        enableLocationButton.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(16)
            $0.width.equalTo(300)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
        }
        privacyRulesUIButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-35)
            $0.centerX.equalToSuperview()
        }
    }
}

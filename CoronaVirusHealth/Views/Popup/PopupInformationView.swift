//
//  PopupView.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/18/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit
import SnapKit

protocol PopupInformationViewDelegate{
    func open(link: String)
}
class PopupInformationView: UIView{
    
    var delegate: PopupInformationViewDelegate?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var linkButton: UIButton = {
        let button = UIButton()
        button.setTitle("Source: www.who.int", for: .normal)
        button.addTarget(self, action: #selector(openLink), for: .touchUpInside)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        return button
    }()
    
    @objc func openLink(){
        delegate?.open(link: "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/")
    }
    
    func set(info: [PreventionInfoModel]){
        info.forEach{
            let titleLabel = UILabel()
            titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
            titleLabel.textColor = Colors.black.color
            titleLabel.text = $0.title
            titleLabel.numberOfLines = 0
            stackView.addArrangedSubview(titleLabel)
            $0.description.forEach { (description) in
                let descLabel = UILabel()
                descLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
                descLabel.textColor = Colors.black.color
                descLabel.text = description
                descLabel.numberOfLines = 0
                stackView.addArrangedSubview(descLabel)
            }
        }
        stackView.addArrangedSubview(linkButton)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.snp.makeConstraints {
            $0.height.equalTo(400)
        }
        self.backgroundColor = Colors.background.color
        self.addSubview(scrollView)
        scrollView.addSubview(stackView)
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-20)
            $0.width.equalTo(scrollView.snp.width).offset(-40)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

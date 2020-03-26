//
//  ResultView.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/19/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

class ResultView: UIView{
    
    var valueLabel: UILabel!
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    func set(result: ResultModel){
        valueLabel.text = result.value
        titleLabel.text = result.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
private extension ResultView{
    func configureUI(){
        setViews()
        addViews()
        setConstraints()
    }
    func setViews(){
        valueLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            label.textColor = Colors.black.color
            label.textAlignment = .center
            label.numberOfLines = 1
            return label
        }()
        titleLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
            label.textColor = Colors.black.color
            label.textAlignment = .center
            label.numberOfLines = 0
            return label
        }()
    }
    func addViews(){
        [valueLabel, titleLabel].forEach{
            self.addSubview($0)
        }
    }
    func setConstraints(){
        valueLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalTo(titleLabel.snp.centerX)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(valueLabel.snp.bottom).offset(2)
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
}


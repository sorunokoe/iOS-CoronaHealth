//
//  OptionView.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/21/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

protocol OptionViewDelegate{
    func select(index: Int)
}
class OptionView: UIView{
    
    private var option: OptionModel?
    private var index: Int?
    var optionView: UIView!
    var titleLabel: UILabel!
    
    var delegate: OptionViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    func set(option: OptionModel, index: Int){
        self.option = option
        self.index = index
        titleLabel.text = NSLocalizedString(option.title, comment: "")
        set(value: option.value)
    }
    
    func set(value: Bool){
        if value{
            self.optionView.backgroundColor = Colors.black.color
        }else{
            self.optionView.backgroundColor = .clear
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
private extension OptionView{
    @objc func touched(){
        guard let index = index else { return }
        self.delegate?.select(index: index)
    }
    func configureUI(){
        setViews()
        addViews()
        setConstraints()
    }
    func setViews(){
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(touched))
        self.addGestureRecognizer(tapGR)
        optionView = {
            let view = UIView()
            view.backgroundColor = .clear
            view.layer.cornerRadius = 9
            view.layer.borderColor = Colors.black.color.cgColor
            view.layer.borderWidth = 1.0
            return view
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
        [optionView, titleLabel].forEach{
            self.addSubview($0)
        }
    }
    func setConstraints(){
        optionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(18)
            $0.height.equalTo(18)
            $0.centerX.equalTo(titleLabel.snp.centerX)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(optionView.snp.bottom).offset(2)
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
}


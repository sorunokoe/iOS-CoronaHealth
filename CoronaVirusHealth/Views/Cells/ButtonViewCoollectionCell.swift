//
//  ButtonViewCoollectionCell.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/18/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

protocol ButtonViewCoollectionCellDelegate{
    func nextTouched()
}
class ButtonViewCoollectionCell: UICollectionViewCell{
    
    var button: UIButton!
    var delegate: ButtonViewCoollectionCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
private extension ButtonViewCoollectionCell{
    @objc func nextTouched(){
        delegate?.nextTouched()
    }
    func configureUI(){
        setViews()
        addViews()
        setConstraints()
    }
    func setViews(){
        button = {
            let button = UIButton()
            button.set(style: .black)
            button.setTitle("Next", for: .normal)
            button.addTarget(self, action: #selector(nextTouched), for: .touchUpInside)
            return button
        }()
    }
    func addViews(){
        self.addSubview(button)
    }
    func setConstraints(){
        button.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(60)
        }
    }
}

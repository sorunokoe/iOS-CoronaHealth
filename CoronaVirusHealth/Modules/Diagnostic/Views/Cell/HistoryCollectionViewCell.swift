//
//  HistoryCollectionViewCell.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/19/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit


class HistoryCollectionViewCell: UICollectionViewCell{
    
    private var shadowView: UIView!
    private var frameView: UIView!
    var dateLabel: UILabel!
    var stackView: UIStackView!
    var injectedTitleLabel: UILabel!
    var injectedValueLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(result: DiagnosticResultModel){
        self.dateLabel.text = result.date
        self.injectedTitleLabel.text = NSLocalizedString("infected probality", comment: "")
        self.injectedValueLabel.text = "\(result.injectionChance)%"
        result.data.forEach{
            let view = ResultView()
            view.set(result: $0)
            stackView.addArrangedSubview(view)
        }
        self.layoutIfNeeded()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clear()
    }
       
}
private extension HistoryCollectionViewCell{
    func clear(){
        self.dateLabel.text = nil
        self.injectedTitleLabel.text = nil
        self.injectedValueLabel.text = nil
        removeAllArrangedSubviews()
        self.layoutIfNeeded()
    }
    func removeAllArrangedSubviews() {
        let removedSubviews = stackView.arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.stackView.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
    func configureUI(){
        setViews()
        addViews()
        setConstraints()
    }
    func setViews(){
        shadowView = {
            let view = UIView()
            view.backgroundColor = Colors.background.color
            view.layer.shadowColor = Colors.black.color.cgColor
            view.layer.shadowOffset = CGSize(width: 0, height: 1)
            view.layer.shadowOpacity = 0.8
            view.layer.shadowRadius = 30
            view.layer.cornerRadius = 20
            view.alpha = 0.1
            return view
        }()
        frameView = {
            let view = UIView()
            view.layer.cornerRadius = 20
            view.backgroundColor = .clear
//            view.layer.borderColor = Colors.black.color.cgColor
//            view.layer.borderWidth = 1.0
            
            return view
        }()
        dateLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            label.textColor = Colors.black.color
            return label
        }()
        stackView = {
            let stackView = UIStackView()
            stackView.alignment = .center
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            return stackView
        }()
        injectedTitleLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
            label.textColor = Colors.black.color
            label.textAlignment = .center
            label.numberOfLines = 0
            return label
        }()
        injectedValueLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            label.textColor = Colors.black.color
            label.textAlignment = .center
            label.numberOfLines = 1
            return label
        }()
    }
    func addViews(){
        self.addSubview(shadowView)
        self.addSubview(frameView)
        [dateLabel, stackView, injectedTitleLabel, injectedValueLabel].forEach{
            frameView.addSubview($0)
        }
    }
    func setConstraints(){
        let width = UIScreen.main.bounds.width-40
        shadowView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        frameView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(width)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        stackView.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(12)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalTo(injectedTitleLabel.snp.left).offset(-20)
            $0.bottom.equalToSuperview().offset(-20)
        }
        injectedValueLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        injectedTitleLabel.snp.makeConstraints {
            $0.top.equalTo(injectedValueLabel.snp.bottom).offset(2)
            $0.centerX.equalTo(injectedValueLabel.snp.centerX)
            $0.bottom.equalToSuperview().offset(-20)
            $0.width.equalTo(50)
        }
    }
}

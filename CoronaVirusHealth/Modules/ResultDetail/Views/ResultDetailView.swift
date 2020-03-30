//
//  ResultDetailView.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/24/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit
import SnapKit

class ResultDetailView: UIView{
    
    var titlelabel: UILabel!
    var chanceLabel: UILabel!
    var reasonTitle: UILabel!
    var reasonStackView: UIStackView!
    var readMoreButton: UIButton!
    var shareTitleLabel: UILabel!
    var shareButton: UIButton!
    var closeButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(symptomes: [String]){
        for symptome in symptomes{
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            label.textColor = Colors.black.color
            label.text = "- \(NSLocalizedString(symptome, comment: ""))"
            reasonStackView.addArrangedSubview(label)
        }
        if symptomes.isEmpty{
            reasonTitle.isHidden = true
            reasonStackView.isHidden = true
        }
    }
    
}
private extension ResultDetailView{
    
    func configureUI(){
        setViews()
        addViews()
        setConstraints()
    }
    
    func setViews(){
        self.backgroundColor = Colors.background.color
        titlelabel = {
            let label = UILabel()
            label.text = NSLocalizedString("the probability that you are infected coronavirus", comment: "")
            label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            label.textColor = Colors.black.color
            label.numberOfLines = 0
            label.textAlignment = .center
            label.textAlignment = .center
            return label
        }()
        chanceLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 78, weight: .bold)
            label.textColor = Colors.black.color
            return label
        }()
        reasonTitle = {
            let label = UILabel()
            label.text = NSLocalizedString("because of following reasons:", comment: "")
            label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            label.textColor = Colors.black.color
            return label
        }()
        reasonStackView = {
            let stackView = UIStackView()
            stackView.alignment = .leading
            stackView.distribution = .fillEqually
            stackView.axis = .vertical
            return stackView
        }()
        readMoreButton = {
            let button = UIButton()
            button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            button.setTitle(NSLocalizedString("Read more about symptoms of coronavirus", comment: ""), for: .normal)
            button.setTitleColor(UIColor.systemBlue, for: .normal)
            return button
        }()
        shareTitleLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            label.textColor = Colors.black.color
            label.numberOfLines = 0
            label.text = NSLocalizedString("Share your result with your friend", comment: "")
            return label
        }()
        shareButton = {
            let button = UIButton()
            button.set(style: .black)
            button.setImage(UIImage(named: "common-share-white"), for: .normal)
            return button
        }()
        closeButton = {
            let button = UIButton()
            button.setTitle(NSLocalizedString("Close", comment: ""), for: .normal)
            button.set(style: .black)
            return button
        }()
    }
    func addViews(){
        [titlelabel, chanceLabel, reasonTitle, reasonStackView,
         readMoreButton, shareTitleLabel, shareButton, closeButton].forEach{
            self.addSubview($0)
        }
    }
    func setConstraints(){
        titlelabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(160)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        chanceLabel.snp.makeConstraints {
            $0.top.equalTo(titlelabel.snp.bottom).offset(45)
            $0.centerX.equalToSuperview()
        }
        reasonTitle.snp.makeConstraints {
            $0.top.equalTo(chanceLabel.snp.bottom).offset(45)
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview().offset(-30)
        }
        reasonStackView.snp.makeConstraints {
            $0.top.equalTo(reasonTitle.snp.bottom).offset(8)
            $0.left.equalTo(reasonTitle.snp.left).offset(12)
            $0.right.equalToSuperview().offset(-30)
        }
        readMoreButton.snp.makeConstraints {
            $0.top.equalTo(reasonStackView.snp.bottom).offset(16)
            $0.right.equalToSuperview().offset(-30)
        }
        shareTitleLabel.snp.makeConstraints {
            $0.top.equalTo(readMoreButton.snp.bottom).offset(50)
            $0.left.equalToSuperview().offset(30)
            $0.right.equalTo(shareButton.snp.left).offset(-20)
        }
        shareButton.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-30)
            $0.centerY.equalTo(shareTitleLabel.snp.centerY)
            $0.width.equalTo(50)
            $0.height.equalTo(50)
        }
        closeButton.snp.makeConstraints {
            $0.top.equalTo(shareTitleLabel.snp.bottom).offset(50)
            $0.width.equalTo(300)
            $0.height.equalTo(60)
            $0.centerX.equalToSuperview()
        }
    }
    
}

//
//  PreventionCollectionViewCell.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/19/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit


class PreventionCollectionViewCell: UICollectionViewCell{
    
    private var frameView: UIView!
    var titleLabel: UILabel!
    var readMore: UILabel!
    var logoImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(prevention: PreventionModel){
        titleLabel.text = prevention.title
        readMore.text = NSLocalizedString("Read more", comment: "")
        logoImageView.image = UIImage(named: prevention.image)
    }
    
    override func prepareForReuse() {
        clear()
        super.prepareForReuse()
    }
       
}
private extension PreventionCollectionViewCell{
    func clear(){
        titleLabel.text = nil
        logoImageView.image = nil
    }
    func configureUI(){
        setViews()
        addViews()
        setConstraints()
    }
    func setViews(){
        frameView = {
            let view = UIView()
            view.layer.cornerRadius = 20
            view.layer.borderColor = Colors.black.color.cgColor
            view.layer.borderWidth = 1.0
            return view
        }()
        titleLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            label.textColor = Colors.black.color
            label.numberOfLines = 0
            return label
        }()
        readMore = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            label.textColor = Colors.black.color
            return label
        }()
        logoImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
    }
    func addViews(){
        self.addSubview(frameView)
        [titleLabel, readMore, logoImageView].forEach{
            frameView.addSubview($0)
        }
    }
    func setConstraints(){
        frameView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(260)
            $0.height.equalTo(90)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.left.equalToSuperview().offset(13)
            $0.right.equalTo(logoImageView.snp.left).offset(-13)
        }
        readMore.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(3)
            $0.left.equalToSuperview().offset(13)
            $0.right.equalTo(logoImageView.snp.left).offset(-13)
//            $0.bottom.equalToSuperview().offset(-13)
        }
        logoImageView.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.height.equalTo(50)
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-13)
        }
    }
}

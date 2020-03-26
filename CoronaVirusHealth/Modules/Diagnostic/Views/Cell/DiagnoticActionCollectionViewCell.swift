//
//  DiagnoticActionCollectionViewCell.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/19/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit


class DiagnosticActionCollectionViewCell: UICollectionViewCell{
    
    private var frameView: UIView!
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(action: DiagnosticActionModel){
        titleLabel.text = action.title
        descriptionLabel.text = action.description
    }
    
    override func prepareForReuse() {
        clear()
        super.prepareForReuse()
    }
       
}
private extension DiagnosticActionCollectionViewCell{
    func clear(){
        titleLabel.text = nil
        descriptionLabel.text = nil
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
            view.layer.borderColor = UIColor.systemBlue.cgColor
            view.layer.borderWidth = 1.0
            return view
        }()
        imageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "stethoscope")
            return imageView
        }()
        titleLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            label.textColor = UIColor.systemBlue
            return label
        }()
        descriptionLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            label.textColor = Colors.black.color
            label.numberOfLines = 0
            return label
        }()
    }
    func addViews(){
        self.addSubview(frameView)
        [imageView, titleLabel, descriptionLabel].forEach{
            frameView.addSubview($0)
        }
    }
    func setConstraints(){
        frameView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(280)
        }
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.right.equalToSuperview().offset(-13)
            $0.width.equalTo(36)
            $0.height.equalTo(36)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom)
            $0.left.equalToSuperview().offset(13)
            $0.right.equalToSuperview().offset(-13)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.left.equalToSuperview().offset(13)
            $0.right.equalToSuperview().offset(-13)
        }
    }
}

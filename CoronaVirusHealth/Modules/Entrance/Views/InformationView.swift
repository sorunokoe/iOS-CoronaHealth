//
//  InformationView.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/18/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit
import SnapKit

class InformationView: UIView{
    
    enum Identifier: String{
        case fieldID = "FieldID"
        case buttonID = "ButtonID"
    }
    
    var dataSource: InformationDataSource
    var descriptionLabel: UILabel!
    var collectionView: UICollectionView!
    
    init(frame: CGRect, dataSource: InformationDataSource) {
        self.dataSource = dataSource
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
private extension InformationView{
    func configureUI(){
        setViews()
        addViews()
        setConstraints()
    }
    func setViews(){
        descriptionLabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            label.textColor = Colors.black.color
            label.textAlignment = .center
            label.numberOfLines = 0
            label.text = NSLocalizedString("Please give us more information about you", comment: "")
            return label
        }()
        collectionView = {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.estimatedItemSize = CGSize(width: 100, height: 100)
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumLineSpacing = 10
            flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
            collectionView.register(FieldViewCollectionCell.self, forCellWithReuseIdentifier: Identifier.fieldID.rawValue)
            collectionView.register(ButtonViewCoollectionCell.self, forCellWithReuseIdentifier: Identifier.buttonID.rawValue)
            collectionView.backgroundColor = .clear
            collectionView.dataSource = dataSource
            collectionView.showsVerticalScrollIndicator = false
            collectionView.showsHorizontalScrollIndicator = false
            return collectionView
        }()
    }
    func addViews(){
        [descriptionLabel, collectionView].forEach {
            self.addSubview($0)
        }
    }
    func setConstraints(){
        descriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview().offset(-30)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

//
//  MainView.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/19/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit


class MainView: UIView{
    
    enum Identifier: String{
        case preventionHeaderId
        case preventionCellId
    }
    
    var collectionView: UICollectionView!
    var dataSource: MainViewDataSource
    
    init(frame: CGRect, dataSource: MainViewDataSource) {
        self.dataSource = dataSource
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
private extension MainView{
    func configureUI(){
        setViews()
        addViews()
        setConstraints()
    }
    func setViews(){
        collectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.estimatedItemSize = CGSize(width: 100, height: 100)
            layout.headerReferenceSize = CGSize(width: 120, height: 50)
            let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collection.backgroundColor = .clear
            collection.register(PreventionCellCollection.self, forCellWithReuseIdentifier: Identifier.preventionCellId.rawValue)
            collection.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Identifier.preventionHeaderId.rawValue)
            collection.dataSource = dataSource
            collection.showsVerticalScrollIndicator = false
            collection.showsHorizontalScrollIndicator = false
            return collection
        }()
    }
    func addViews(){
        self.addSubview(collectionView)
    }
    func setConstraints(){
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}


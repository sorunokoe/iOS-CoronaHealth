//
//  DiagnosticView.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/19/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit


class DiagnosticView: UIView{
    
    enum Identifier: String{
        case diagnosticHeaderId
        case diagnosticCellId
        case hisotryCellId
    }
    
    var collectionView: UICollectionView!
    var dataSource: DiagnosticViewDataSource
    
    init(frame: CGRect, dataSource: DiagnosticViewDataSource) {
        self.dataSource = dataSource
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
private extension DiagnosticView{
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
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
            let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collection.translatesAutoresizingMaskIntoConstraints = false
            collection.backgroundColor = .clear
            collection.register(DiagnosticActionCellCollection.self, forCellWithReuseIdentifier: Identifier.diagnosticCellId.rawValue)
            collection.register(HistoryCollectionViewCell.self, forCellWithReuseIdentifier: Identifier.hisotryCellId.rawValue)
            collection.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Identifier.diagnosticHeaderId.rawValue)
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


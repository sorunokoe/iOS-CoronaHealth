//
//  DiagnosticDetailView.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/21/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit
import SnapKit

class DiagnosticDetailView: UIView{
    
    enum Identifier: String{
        case fieldCellID
        case optionsCellID
        case buttonCellID
        case headerID
    }
    
    var collectionView: UICollectionView!
    var dataSource: DiagnosticDetailDataSource
    
    init(frame: CGRect, dataSource: DiagnosticDetailDataSource) {
        self.dataSource = dataSource
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
private extension DiagnosticDetailView{
    func configureUI(){
        setViews()
        addViews()
        setConstraints()
    }
    func setViews(){
        collectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.estimatedItemSize = CGSize(width: 100, height: 100)
            layout.headerReferenceSize = CGSize(width: 100, height: 50)
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 25, right: 0)
            let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collection.backgroundColor = .clear
            collection.register(FieldViewCollectionCell.self, forCellWithReuseIdentifier: Identifier.fieldCellID.rawValue)
            collection.register(OptionsViewCollectionCell.self, forCellWithReuseIdentifier: Identifier.optionsCellID.rawValue)
            collection.register(ButtonViewCoollectionCell.self, forCellWithReuseIdentifier: Identifier.buttonCellID.rawValue)
            collection.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Identifier.headerID.rawValue)
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

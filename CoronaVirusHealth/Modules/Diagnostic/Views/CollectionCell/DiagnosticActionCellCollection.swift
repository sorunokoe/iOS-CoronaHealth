//
//  DiagnosticActionCellCollection.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/19/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//


import UIKit


class DiagnosticActionCellCollection: UICollectionViewCell{
    
    enum Identifier: String{
        case diagnosticActionCellId
    }
    
    var collectionView: UICollectionView!
    var dataSource: DiagnosticActionDataSource!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDataSource(dataSource: DiagnosticActionDataSource){
        self.dataSource = dataSource
        collectionView.dataSource = dataSource
        self.dataSource.getActions()
    }
    
}
private extension DiagnosticActionCellCollection{
    func configureUI(){
        setViews()
        addViews()
        setConstraints()
    }
    func setViews(){
        collectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 320, height: 120)
            layout.scrollDirection = .horizontal
            layout.sectionInset = UIEdgeInsets(top: 0, left: 32, bottom: 25, right: 32)
            let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collection.backgroundColor = .clear
            collection.register(DiagnosticActionCollectionViewCell.self, forCellWithReuseIdentifier: Identifier.diagnosticActionCellId.rawValue)
            collection.showsVerticalScrollIndicator = false
            collection.showsHorizontalScrollIndicator = false
            return collection
        }()
    }
    func addViews(){
        self.addSubview(collectionView)
    }
    func setConstraints(){
        let width = UIScreen.main.bounds.width
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(120+25)
        }
    }
}

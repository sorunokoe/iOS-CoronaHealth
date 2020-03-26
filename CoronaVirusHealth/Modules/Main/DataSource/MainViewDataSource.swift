//
//  MainViewDataSource.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/19/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

class MainViewDataSource: NSObject{
    
    var sections: [Section] = [.prevention]
    
    var preventionDataSource: PreventionDataSource
    var preventionDelegate: UICollectionViewDelegate?
    
    init(preventionDataSource: PreventionDataSource) {
        self.preventionDataSource = preventionDataSource
        super.init()
    }
    
    enum Section{
        case prevention
        var title: String{
            switch self {
            case .prevention:
                return NSLocalizedString("Prevention", comment: "")
            }
        }
        var cells: [Cell]{
            switch self{
            case .prevention:
                return [.prevention]
            }
        }
    }
    enum Cell{
        case prevention
    }
    
}

extension MainViewDataSource: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MainView.Identifier.preventionHeaderId.rawValue, for: indexPath) as! Header
        let section = sections[indexPath.section]
        headerView.set(title: section.title, font: UIFont.systemFont(ofSize: 24, weight: .medium))
        return headerView
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].cells.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section]{
        case .prevention:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainView.Identifier.preventionCellId.rawValue, for: indexPath) as! PreventionCellCollection
            cell.setDataSource(dataSource: preventionDataSource, delegate: preventionDelegate)
            return cell
        }
    }
}

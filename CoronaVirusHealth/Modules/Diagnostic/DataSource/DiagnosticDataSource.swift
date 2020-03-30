//
//  DiagnosticDataSource.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/19/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

class DiagnosticViewDataSource: NSObject{
    
    enum Section{
        case actions
        case history
        var title: String{
            switch self {
            case .actions:
                return NSLocalizedString("Diagnostic", comment: "")
            case .history:
                return NSLocalizedString("History", comment: "")
            }
        }
        var cells: [Cell]{
            switch self{
            case .actions:
                return [.start]
            case .history:
                return [.history]
            }
        }
    }
    enum Cell{
        case start
        case history
    }
    
    var sections: [Section] = [.actions, .history]
    var results: [DiagnosticResultModel] = []{
        didSet{
            results = results.reversed()
        }
    }
    
    var actionDelegate: UICollectionViewDelegate?
    
}

extension DiagnosticViewDataSource: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DiagnosticView.Identifier.diagnosticHeaderId.rawValue, for: indexPath) as! Header
        let section = sections[indexPath.section]
        switch section {
        case .actions:
            headerView.set(title: section.title, font: UIFont.systemFont(ofSize: 24, weight: .medium))
        case .history:
            headerView.set(title: section.title, font: UIFont.systemFont(ofSize: 18, weight: .medium))
        }
        return headerView
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sections[section]{
        case .history:
            return results.count
        default:
            return sections[section].cells.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section]{
        case .actions:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiagnosticView.Identifier.diagnosticCellId.rawValue, for: indexPath) as! DiagnosticActionCellCollection
            let dataSource = DiagnosticActionDataSource()
            cell.collectionView.delegate = actionDelegate
            cell.setDataSource(dataSource: dataSource)
            return cell
        case .history:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiagnosticView.Identifier.hisotryCellId.rawValue, for: indexPath) as! HistoryCollectionViewCell
            let result = results[indexPath.item]
            cell.set(result: result)
            return cell
        }
    }
}

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
    
    func getHistoryResults(){
//        let resultItem = DiagnosticResultModel(date: "18.03.2020 at 14:23", data: [
//            ResultModel(title: "temperature", value: "36.6*"),
//            ResultModel(title: "cough", value: "No"),
//            ResultModel(title: "headache", value: "No")
//        ], injectionChance: 23)
//        let resultItem2 = DiagnosticResultModel(date: "17.03.2020 at 14:23", data: [
//            ResultModel(title: "temperature", value: "36.6*"),
//            ResultModel(title: "cough", value: "No"),
//            ResultModel(title: "headache", value: "No")
//        ], injectionChance: 12)
//        let resultItem3 = DiagnosticResultModel(date: "17.03.2020 at 14:23", data: [
//            ResultModel(title: "temperature", value: "36.6*"),
//            ResultModel(title: "cough", value: "No"),
//            ResultModel(title: "headache", value: "No")
//        ], injectionChance: 13)
//        let resultItem4 = DiagnosticResultModel(date: "17.03.2020 at 14:23", data: [
//            ResultModel(title: "temperature", value: "36.6*"),
//            ResultModel(title: "cough", value: "No"),
//            ResultModel(title: "headache", value: "No")
//        ], injectionChance: 15)
//        let resultItem5 = DiagnosticResultModel(date: "17.03.2020 at 14:23", data: [
//            ResultModel(title: "temperature", value: "36.6*"),
//            ResultModel(title: "cough", value: "No"),
//            ResultModel(title: "headache", value: "No")
//        ], injectionChance: 16)
//        let resultItem6 = DiagnosticResultModel(date: "17.03.2020 at 14:23", data: [
//            ResultModel(title: "temperature", value: "36.6*"),
//            ResultModel(title: "cough", value: "No"),
//            ResultModel(title: "headache", value: "No")
//        ], injectionChance: 12)
//        let resultItem7 = DiagnosticResultModel(date: "17.03.2020 at 14:23", data: [
//            ResultModel(title: "temperature", value: "36.6*"),
//            ResultModel(title: "cough", value: "No"),
//            ResultModel(title: "headache", value: "No")
//        ], injectionChance: 12)
//        let resultItem8 = DiagnosticResultModel(date: "17.03.2020 at 14:23", data: [
//            ResultModel(title: "temperature", value: "36.6*"),
//            ResultModel(title: "cough", value: "No"),
//            ResultModel(title: "headache", value: "No")
//        ], injectionChance: 12)
//        results = [resultItem, resultItem2, resultItem3, resultItem4, resultItem5, resultItem6, resultItem7, resultItem8]
    }
    
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

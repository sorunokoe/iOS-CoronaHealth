//
//  DiagnosticDetailDataSource.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/21/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

class DiagnosticDetailDataSource: NSObject{
    
    var sections: [Section] = [.questions, .next]
    var questions: [InformationModel] = []
    var delegate: ButtonViewCoollectionCellDelegate?
    
    enum Section{
        case questions
        case next
    }
    
    func getQuestions(){
        var questions: [InformationModel] = []
        DiagnosticSymptomes.allSymptomes.forEach{
            let q = InformationModel(type: .options, title: $0.title, value: "", list: nil, fieldType: .number, symptome: $0, options: [
                OptionModel(title: "No", value: false),
                OptionModel(title: "Yes", value: false)
            ])
            questions.append(q)
        }
        self.questions = questions
    }
    
}
extension DiagnosticDetailDataSource: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DiagnosticDetailView.Identifier.headerID.rawValue, for: indexPath) as! Header
        let section = sections[indexPath.section]
        if section == .questions{
            headerView.set(title: NSLocalizedString("Indicate your symptoms", comment: ""), font: UIFont.systemFont(ofSize: 18, weight: .medium))
            return headerView
        }
        headerView.frame = .zero
        return headerView
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sections[section]{
        case .questions:
            return questions.count
        case .next:
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section]{
        case .questions:
            let question = questions[indexPath.item]
            switch question.type{
            case .field:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiagnosticDetailView.Identifier.fieldCellID.rawValue, for: indexPath) as! FieldViewCollectionCell
                cell.set(field: question, delegate: nil, indexPath: indexPath)
                cell.delegate = self
                return cell
            case .options:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiagnosticDetailView.Identifier.optionsCellID.rawValue, for: indexPath) as! OptionsViewCollectionCell
                cell.set(question: question, delegate: nil, indexPath: indexPath)
                cell.delegate = self
                return cell
            }
        case .next:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiagnosticDetailView.Identifier.buttonCellID.rawValue, for: indexPath) as! ButtonViewCoollectionCell
            cell.delegate = delegate
            cell.button.setTitle(NSLocalizedString("Next", comment: ""), for: .normal)
            return cell
        }
    }
}
extension DiagnosticDetailDataSource: FieldViewCollectionCellDelegate{
    func set(value: String?, index: Int, optionIndex: Int?, option: OptionModel?) {
        guard let value = value else { return }
        self.questions[index].value = value
        guard let options = self.questions[index].options else { return }
        for i in 0..<options.count{
            self.questions[index].options?[i].value = false
        }
        guard let optionIndex = optionIndex, let option = option else { return }
        self.questions[index].options?[optionIndex] = option
    }
}

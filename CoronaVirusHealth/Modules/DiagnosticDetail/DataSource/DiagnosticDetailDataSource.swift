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
        let q = InformationModel(type: .field, title: NSLocalizedString("Temperature", comment: ""), value: "", list: nil, fieldType: .number, options: nil)
        let q1 = InformationModel(type: .options, title: NSLocalizedString("How dry is your cough?", comment: ""), value: "", list: nil, fieldType: .number, options: [
            OptionModel(title: NSLocalizedString("No cough", comment: ""), value: false),
            OptionModel(title: NSLocalizedString("Normal", comment: ""), value: false),
            OptionModel(title: NSLocalizedString("Dry", comment: ""), value: false)
        ])
        let q2 = InformationModel(type: .options, title: NSLocalizedString("Do you have headache?", comment: ""), value: "", list: nil, fieldType: .number, options: [
            OptionModel(title: NSLocalizedString("No headache", comment: ""), value: false),
            OptionModel(title: NSLocalizedString("Little bit", comment: ""), value: false),
            OptionModel(title: NSLocalizedString("strong tension headaches", comment: ""), value: false)
        ])
        questions = [q, q1, q2]
    }
    
}
extension DiagnosticDetailDataSource: UICollectionViewDataSource{
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
        guard let optionIndex = optionIndex, let option = option else { return }
        self.questions[index].options?[optionIndex] = option
    }
}

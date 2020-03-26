//
//  DiagnosticActionDataSource.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/19/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

class DiagnosticActionDataSource: NSObject{
    var actions: [DiagnosticActionModel] = []
    
    func getActions(){
        let start = DiagnosticActionModel(title: NSLocalizedString("Start diagnostic", comment: ""), description: NSLocalizedString("diagnostic action description", comment: ""))
        actions = [start]
    }
}
extension DiagnosticActionDataSource: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.actions.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiagnosticActionCellCollection.Identifier.diagnosticActionCellId.rawValue, for: indexPath) as! DiagnosticActionCollectionViewCell
        let action = self.actions[indexPath.item]
        cell.set(action: action)
        return cell
    }
}

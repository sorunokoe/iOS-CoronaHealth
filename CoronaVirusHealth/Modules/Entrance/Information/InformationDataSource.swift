//
//  InformationDataSource.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/18/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

class InformationDataSource: NSObject, UICollectionViewDataSource{
    
    var fields: [InformationModel] = []
    var fieldDelegate: FieldViewCollectionCellDelegate?
    var buttonDelegate: ButtonViewCoollectionCellDelegate?
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return fields.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InformationView.Identifier.fieldID.rawValue, for: indexPath) as! FieldViewCollectionCell
            let field = fields[indexPath.item]
            cell.set(field: field, delegate: fieldDelegate, indexPath: indexPath)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InformationView.Identifier.buttonID.rawValue, for: indexPath) as! ButtonViewCoollectionCell
        cell.delegate = buttonDelegate
        return cell
    }
    
}


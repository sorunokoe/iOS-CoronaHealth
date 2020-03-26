//
//  InformationViewController.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/18/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

protocol InformationViewControllerDelegate{
    func nextTouched()
}
class InformationViewController: UIViewController, InformationViewControllerProtocol{
    
    var contentView: InformationView
    var delegate: InformationViewControllerDelegate?
    
    init(contentView: InformationView) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        super.loadView()
        self.view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.dataSource.fieldDelegate = self
        contentView.dataSource.buttonDelegate = self
        getFields()
    }
    
}
private extension InformationViewController{
    func getFields(){
//        let country = InformationModel(title: "Country", value: "", list: ["USA", "UK", "Kazakhstan", "Japan", "Ukraine", "France", "German", "Russia"], fieldType: .popup)
//        let state = InformationModel(title: "State", value: "", list: ["Florida", "California"], fieldType: .popup)
//        let city = InformationModel(title: "City", value: "", list: ["Miami", "San-Francisco"], fieldType: .popup)
        let age = InformationModel(title: NSLocalizedString("Age", comment: ""), value: "", fieldType: .number)
        
        contentView.dataSource.fields = [age]
        contentView.collectionView.reloadData()
    }
}
extension InformationViewController: ButtonViewCoollectionCellDelegate{
    func nextTouched() {
        delegate?.nextTouched()
    }
}
extension InformationViewController: FieldViewCollectionCellDelegate{
    func set(value: String?, index: Int, optionIndex: Int?, option: OptionModel?) {
        guard let value = value else { return }
        contentView.dataSource.fields[index].value = value
    }
}

//
//  DiagnosticDetailViewController.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/21/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

class DiagnosticDetailViewController: UIViewController, DiagnosticDetailViewControllerProtocol{
    
    var storageService: CacheServer
    var contentView: DiagnosticDetailView
    var diagnosticService: DiagnosticServiceProtocol
    
    init(contentView: DiagnosticDetailView, storageService: CacheServer, diagnosticService: DiagnosticServiceProtocol) {
        self.storageService = storageService
        self.contentView = contentView
        self.diagnosticService = diagnosticService
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
        self.contentView.dataSource.getQuestions()
        self.contentView.dataSource.delegate = self
        self.contentView.collectionView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = Colors.background.color
    }
    
}
extension DiagnosticDetailViewController: ButtonViewCoollectionCellDelegate{
    func nextTouched() {
        let result = saveToStorage()
        let vc = ResultDetailRouter.generate(with: result)
        NotificationCenter.default.post(name: NSNotification.Name("updateHistory"), object: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.viewControllers.remove(at: 0)
    }
}
private extension DiagnosticDetailViewController{
    func saveToStorage() -> DiagnosticResultModel{
        var data: [ResultModel] = []
        var symptomes: [DiagnosticSymptomes.Symptomes] = []
        self.contentView.dataSource.questions.forEach{
            let result = ResultModel(title: $0.title, value: $0.value)
            if let symptome = $0.symptome, $0.value == "Yes"{
                symptomes.append(symptome)
            }
            data.append(result)
        }
        let injectionChance = diagnosticService.getChanceOfInjection(symptomes: symptomes)
        let symptomesString = symptomes.map { $0.title }
        let result = DiagnosticResultModel(date: "".convert(date: Date()), data: data, symptomes: symptomesString, injectionChance: injectionChance)
        storageService.set(result.object(), key: .totalResult)
        return result
    }
}

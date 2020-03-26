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
    
    init(contentView: DiagnosticDetailView, storageService: CacheServer) {
        self.storageService = storageService
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
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.viewControllers.remove(at: 1)
    }
}
private extension DiagnosticDetailViewController{
    func saveToStorage() -> DiagnosticResultModel{
        var data: [ResultModel] = []
        self.contentView.dataSource.questions.forEach{
            let result = ResultModel(title: $0.title, value: $0.value)
            data.append(result)
        }
        let result = DiagnosticResultModel(date: "".convert(date: Date()), data: data, injectionChance: 32)
        storageService.set(result.object(), key: .totalResult)
        return result
    }
}

//
//  DiagnosticViewController.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/18/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

class DiagnosticViewController: UIViewController, DiagnosticViewControllerProtocol{
    
    var database: CacheServer
    var router: DiagnosticRouterProtocol
    var contentView: DiagnosticView!
    
    init(contentView: DiagnosticView, router: DiagnosticRouterProtocol, database: CacheServer) {
        self.contentView = contentView
        self.router = router
        self.database = database
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
        self.contentView.dataSource.actionDelegate = self
        let historyResults = database.get(.totalResult)
        self.contentView.dataSource.results = historyResults
        self.contentView.collectionView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = Colors.background.color
    }
    
}
extension DiagnosticViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router.nav(to: .diagnosticDetail)
    }
}

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
    
    private lazy var refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(updateHistory(_:)), for: .valueChanged)
        return control
    }()
    
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
        getHistory()
        contentView.collectionView.refreshControl = refreshControl

        NotificationCenter.default.addObserver(self, selector: #selector(updateHistory(_:)), name: NSNotification.Name("updateHistory"), object: nil)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = Colors.background.color
        
    }
    func getHistory(){
        let historyResults = database.get(.totalResult)
        self.contentView.dataSource.results = historyResults
        self.contentView.collectionView.reloadData()
    }
}
private extension DiagnosticViewController{
    @objc func updateHistory(_ sender: Any){
        getHistory()
    }
}
extension DiagnosticViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router.nav(to: .diagnosticDetail)
    }
}

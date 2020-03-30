//
//  ResultDetailViewController.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/24/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

class ResultDetailViewController: UIViewController, ResultDetailViewControllerProtocol{
    
    var storageService: CacheServer
    var result: DiagnosticResultModel
    var contentView: ResultDetailView
    
    init(contentView: ResultDetailView, result: DiagnosticResultModel, storageService: CacheServer){
        self.contentView = contentView
        self.result = result
        self.storageService = storageService
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
        configUI()
        bind()
        getResult()
    }
    
}

private extension ResultDetailViewController{
    func configUI(){
        self.navigationController?.navigationBar.isHidden = true
    }
    func bind(){
        self.contentView.closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        self.contentView.shareButton.addTarget(self, action: #selector(share), for: .touchUpInside)
        self.contentView.readMoreButton.addTarget(self, action: #selector(readMore), for: .touchUpInside)
    }
    func getResult(){
        let chance = self.result.injectionChance
        let symptoms = self.result.symptomes
        let result = TotalResultModel(chance: chance, symptoms: symptoms)
        contentView.chanceLabel.text = "\(result.chance)%"
        contentView.set(symptomes: result.symptoms)
    }
    
    
    // MARK:  - Handlers
    @objc func close(){
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    @objc func share(){
        
    }
    @objc func readMore(){
        let link = "https://www.who.int/health-topics/coronavirus#tab=tab_3"
        UIApplication.shared.open(URL(string: link)!, options: [:], completionHandler: nil)
    }
}

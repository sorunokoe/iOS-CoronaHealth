//
//  MainViewController.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/18/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, MainViewControllerProtocol{

    var router: MainRouterProtocol
    var contentView: MainView!
    
    init(contentView: MainView, router: MainRouterProtocol) {
        self.router = router
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
        self.contentView.dataSource.preventionDelegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = Colors.background.color
    }
    
}
extension MainViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let prevention = self.contentView.dataSource.preventionDataSource.prventions[indexPath.item]
        guard let more = prevention.more else { return }
        let view = PopupInformationView()
        view.set(info: more)
        let popupVC = PopupInformationViewController(contentView: view)
        self.present(popupVC, animated: true, completion: nil)
    }
    
}

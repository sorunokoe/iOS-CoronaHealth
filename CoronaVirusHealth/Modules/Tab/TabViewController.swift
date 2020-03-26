//
//  NavigationViewController.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/18/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController{
    
    enum Tabs: String{
        case main
        case world
        case diagnostic
        
        var image: UIImage?{
            return UIImage(named: self.rawValue)
        }
    }
    private var tabs: [Tabs] = [.diagnostic, .world, .main]
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        setupAppearence()
        configureTabItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
private extension TabViewController{
    func setupAppearence() {
        view.backgroundColor = Colors.white.color
        tabBar.tintColor = Colors.black.color
    }
    
    func configureTabItems(){
        var controllers: [UIViewController] = []
        controllers.append(DiagnosticRouter.generate())
        controllers.append(WorldRouter.generate())
        controllers.append(MainRouter.generate())
        self.viewControllers = controllers
        updateTabBarItems()
    }
    
    func updateTabBarItems() {
        guard let items = tabBar.items else { return }
        for (index, item) in items.enumerated() {
            item.image = tabs[index].image
            item.title = nil
        }
    }
}

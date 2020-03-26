//
//  LocationViewController.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/17/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit
import CoreLocation

protocol LocationViewControllerDelegate{
    func loactionGranted()
}
class LocationViewController: UIViewController, LocationViewControllerProtocol{
    
    var contentView: LocationView
    var delegate: LocationViewControllerDelegate?
    
    init(contentView: LocationView) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        
    }
    
}
private extension LocationViewController{
    enum LocationViews{
        case grantLocation
    }
    func checkLocationAuthorization(){
        if CLLocationManager.authorizationStatus() == .denied{
            show(view: .grantLocation)
        }else if LocationService.shared.isLocationGranted(){
            delegate?.loactionGranted()
        }
    }
    func bind(){
        LocationService.shared.delegate = self
        contentView.enableLocationButton
            .addTarget(self, action: #selector(requestGrantLocation), for: .touchUpInside)
    }
    @objc func requestGrantLocation(){
        if LocationService.shared.isLocationGranted(){
            delegate?.loactionGranted()
        }else{
            LocationService.shared.request()
        }
    }
    func show(view: LocationViews){
        switch view{
        case .grantLocation:
            let ac = UIAlertController(title: NSLocalizedString("Activate location", comment: ""), message: NSLocalizedString("Turn on location service in settings", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("Close", comment: ""), style: .cancel, handler: nil)
            ac.addAction(action)
            self.present(ac, animated: true, completion: nil)
        }
    }
}
extension LocationViewController: LocationServiceDelegate{
    func locationAuthorizeChanged() {
        checkLocationAuthorization()
    }
}

//
//  WorldView.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/19/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit
import MapKit

class WorldView: UIView{
    
    var mapView: MKMapView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
private extension WorldView{
    func configureUI(){
        setViews()
        addViews()
        setConstraints()
    }
    func setViews(){
        mapView = {
            let view = MKMapView()
            return view
        }()
    }
    func addViews(){
        self.addSubview(mapView)
    }
    func setConstraints(){
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

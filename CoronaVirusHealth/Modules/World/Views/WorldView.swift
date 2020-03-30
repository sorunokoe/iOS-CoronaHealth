//
//  WorldView.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/19/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import UIKit
import MapKit
import WebKit

class WorldView: UIView{
    
    var webView: WKWebView!
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
        webView = {
            let view = WKWebView()
            let url = URL(string: "https://www.trackcorona.live/map")
            let request = URLRequest(url: url!)
            view.load(request)
            return view
        }()
        mapView = {
            let view = MKMapView()
            return view
        }()
    }
    func addViews(){
        self.addSubview(webView)
    }
    func setConstraints(){
        webView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

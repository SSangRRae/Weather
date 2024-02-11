//
//  LocationTableViewCell.swift
//  Weather
//
//  Created by SangRae Kim on 2/11/24.
//

import UIKit
import MapKit

class LocationTableViewCell: UITableViewCell {
    let mapView = MKMapView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.verticalEdges.equalToSuperview()
        }
        mapView.overrideUserInterfaceStyle = .dark
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

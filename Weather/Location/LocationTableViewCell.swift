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

        mapView.overrideUserInterfaceStyle = .dark
        configureHierarchy()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LocationTableViewCell: Configure {
    func configureHierarchy() {
        contentView.addSubview(mapView)
    }
    
    func setRegionAndAnnotation(coordinate: CLLocationCoordinate2D, meter: CLLocationDistance) {
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: meter, longitudinalMeters: meter)
        
        mapView.setRegion(region, animated: true)
    }
    
    func configureViews() {
        guard let nowWeather = WeatherData.shared.nowWeather, let coord = nowWeather.coord else {
            return
        }
        
        mapView.removeAnnotations(mapView.annotations)
        
        let latitude = coord.lat
        let longitude = coord.lon
        let mid = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: mid, latitudinalMeters: 100000, longitudinalMeters: 100000)
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = mid
        annotation.title = tempText(temp: nowWeather.main.temp)
        
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
    }
    
    func configureConstraints() {
        mapView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.verticalEdges.equalToSuperview()
        }
    }
}

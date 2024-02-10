//
//  ThreeTimeCollectionViewCell.swift
//  Weather
//
//  Created by SangRae Kim on 2/10/24.
//

import UIKit
import Kingfisher

class ThreeTimeCollectionViewCell: UICollectionViewCell {
    let timeLabel: UILabel = {
        let view = UILabel()
        view.setTextColor()
        view.font = FontDesign.biggest.light
        view.textAlignment = .center
        return view
    }()
    
    let iconImage = UIImageView()
    
    let tempLabel: UILabel = {
        let view = UILabel()
        view.setTextColor()
        view.font = FontDesign.biggest.light
        view.textAlignment = .center
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ThreeTimeCollectionViewCell: Configure {
    func configureHierarchy() {
        self.addSubview(timeLabel)
        self.addSubview(iconImage)
        self.addSubview(tempLabel)
    }
    
    func configureViews(_ item: WeatherInfo) {
        let url = URL(string: "https://openweathermap.org/img/wn/\(item.weather[0].icon)@2x.png")
        if let dateTime = item.dateTime {
            timeLabel.text = dateTimeToHour(dateTime: dateTime)
        }
        iconImage.kf.setImage(with: url)
        tempLabel.text = tempText(temp: item.main.temp)
    }
    
    func configureConstraints() {
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(33)
        }
        iconImage.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.size.equalTo(40)
        }
        tempLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(33)
        }
    }
}

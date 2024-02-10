//
//  NowTableViewCell.swift
//  Weather
//
//  Created by SangRae Kim on 2/9/24.
//

import UIKit
import SnapKit

class NowTableViewCell: UITableViewCell {
    let cityLabel: UILabel = {
        let view = UILabel()
        view.setTextColor()
        view.font = FontDesign.info.bold
        return view
    }()
    
    let tempLabel: UILabel = {
        let view = UILabel()
        view.setTextColor()
        view.font = FontDesign.temp.light
        return view
    }()
    
    let descriptionLabel: UILabel = {
        let view = UILabel()
        view.setTextColor()
        view.font = FontDesign.info.light
        return view
    }()
    
    let maxMinTempLabel: UILabel = {
        let view = UILabel()
        view.setTextColor()
        view.font = FontDesign.info.light
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.setBackGroundColor()
        configureHierarchy()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NowTableViewCell: Configure {
    func configureHierarchy() {
        contentView.addSubview(cityLabel)
        contentView.addSubview(tempLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(maxMinTempLabel)
    }
    
    func configureViews(_ item: WeatherInfo) {
        cityLabel.text = item.name
        tempLabel.text = tempText(temp: item.main.temp)
        descriptionLabel.text = item.weather[0].description
        maxMinTempLabel.text = "최고: \(tempText(temp: item.main.tempMax)) | 최저: \(tempText(temp: item.main.tempMin))"
    }
    
    func configureConstraints() {
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(8)
            make.centerX.equalTo(contentView)
            make.height.equalTo(33)
        }
        tempLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom)
            make.centerX.equalTo(contentView)
            make.height.equalTo(66)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(tempLabel.snp.bottom)
            make.centerX.equalTo(contentView)
            make.height.equalTo(22)
        }
        maxMinTempLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            make.centerX.equalTo(contentView)
            make.bottom.equalTo(contentView.snp.bottom).inset(8)
        }
    }
}


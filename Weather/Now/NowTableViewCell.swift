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
        view.text = "Seoul"
        view.setTextColor()
        view.font = .systemFont(ofSize: 25)
        return view
    }()
    
    let tempLabel: UILabel = {
        let view = UILabel()
        view.text = "5.9°"
        view.setTextColor()
        view.font = .systemFont(ofSize: 60)
        return view
    }()
    
    let descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "맑음"
        view.setTextColor()
        view.font = FontDesign.mid.light
        return view
    }()
    
    let maxMinTempLabel: UILabel = {
        let view = UILabel()
        view.text = "최고: 7.0° | 최저: -4.2°"
        view.setTextColor()
        view.font = FontDesign.big.light
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .black
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
    
    func configureViews() {
        
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
            make.top.equalTo(descriptionLabel.snp.bottom)
            make.centerX.equalTo(contentView)
            make.height.equalTo(22)
        }
    }
}


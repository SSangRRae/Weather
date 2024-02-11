//
//  FiveDayTableViewCell.swift
//  Weather
//
//  Created by SangRae Kim on 2/10/24.
//

import UIKit

class FiveDayTableViewCell: UITableViewCell {
    let dateLabel: UILabel = {
        let view = UILabel()
        view.text = "오늘"
        view.textColor = ColorDesign.text.draw
        view.font = FontDesign.biggest.light
        return view
    }()
    
    let iconImage = UIImageView()
    
    let minTempLabel: UILabel = {
        let view = UILabel()
        view.textColor = ColorDesign.text.draw
        view.font = FontDesign.biggest.light
        return view
    }()
    
    let maxTempLabel: UILabel = {
        let view = UILabel()
        view.text = "최고 8"
        view.textColor = ColorDesign.text.draw
        view.font = FontDesign.biggest.light
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FiveDayTableViewCell: Configure {
    func configureHierarchy() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(iconImage)
        contentView.addSubview(minTempLabel)
        contentView.addSubview(maxTempLabel)
        iconImage.image = UIImage(systemName: "xmark")
    }
    
    func configureViews(_ item: WeatherInfo) {
        dateLabel.text = DateFunctions().dateTimeFormattingToDay(item.dateTime)
        iconImage.kf.setImage(with: URL(string: "https://openweathermap.org/img/wn/\(item.weather[0].icon)@2x.png"))
        minTempLabel.text = "최저 \(tempText(temp: item.main.tempMin))"
        maxTempLabel.text = "최고 \(tempText(temp: item.main.tempMax))"
    }
    
    func configureConstraints() {
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(24)
            make.centerY.equalTo(contentView)
        }
        iconImage.snp.makeConstraints { make in
            make.leading.equalTo(dateLabel.snp.trailing).offset(80)
            make.centerY.equalTo(contentView)
            make.size.equalTo(30)
        }
        minTempLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImage.snp.trailing).offset(72)
            make.centerY.equalTo(contentView)
        }
        maxTempLabel.snp.makeConstraints { make in
            make.leading.equalTo(minTempLabel.snp.trailing).offset(24)
            make.centerY.equalTo(contentView)
        }
    }
}

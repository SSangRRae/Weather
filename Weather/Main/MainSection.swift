//
//  MainSection.swift
//  Weather
//
//  Created by SangRae Kim on 2/9/24.
//

import UIKit

enum MainSection: CaseIterable {
    case now
    case threeTime
    case fiveDay
    case location
    case etc
    
    var numberOfRows: Int {
        switch self {
        case .fiveDay: WeatherData.shared.fiveDayWeather.count
        default : 1
        }
    }
    
    var headerTitle: String? {
        switch self {
        case .now: nil
        case .threeTime: "3시간 간격의 일기예보"
        case .fiveDay: "5일 간의 일기예보"
        case .location: "위치"
        case .etc: nil
        }
    }
    
    var heightForRow: CGFloat {
        switch self {
        case .now: 200
        case .threeTime: 150
        case .fiveDay: 50
        case .location: 200
        case .etc: UIScreen.main.bounds.width
        }
    }
}

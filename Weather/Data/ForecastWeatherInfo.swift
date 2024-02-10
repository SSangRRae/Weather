//
//  ForecastWeatherInfo.swift
//  Weather
//
//  Created by SangRae Kim on 2/10/24.
//

import Foundation

struct ForecastWeatherInfo: Decodable {
    let list: [WeatherInfo]
}

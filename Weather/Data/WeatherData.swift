//
//  WeatherData.swift
//  Weather
//
//  Created by SangRae Kim on 2/10/24.
//

import UIKit

class WeatherData {
    static let shared = WeatherData()
    private init() {}
    
    var nowWeather: WeatherInfo?
    var forecastWeather: ForecastWeatherInfo?
    var fiveDayWeather: [WeatherInfo] = []
}

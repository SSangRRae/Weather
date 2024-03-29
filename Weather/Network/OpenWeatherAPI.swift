//
//  OpenWeatherAPI.swift
//  Weather
//
//  Created by SangRae Kim on 2/10/24.
//

import UIKit
import Alamofire

enum OpenWeatherAPI {
    case now(cityID: String)
    case forecast(cityID: String)
    
    var baseURL: String {
        return "https://api.openweathermap.org/data/2.5/"
    }
    
    var url: String {
        switch self {
        case .now: baseURL + "weather"
        case .forecast: baseURL + "forecast"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var params: Parameters {
        switch self {
        case .now(let cityID), .forecast(let cityID): ["appid": APIKey.openWeather, "lang": "kr", "units": "metric", "id": cityID]
        }
    }
}

//
//  OpenWeatherAPI.swift
//  Weather
//
//  Created by SangRae Kim on 2/10/24.
//

import UIKit
import Alamofire

class OpenWeatherManager {
    static let shared = OpenWeatherManager()
    private init() {}
    
    func fetchToOpenWeather(api: OpenWeatherAPI, completionHandler: @escaping (WeatherInfo) -> Void) {
        AF.request(api.url, method: api.method, parameters: api.params).responseDecodable(of: WeatherInfo.self) { response in
            switch response.result {
            case .success(let success):
                dump(success)
                completionHandler(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

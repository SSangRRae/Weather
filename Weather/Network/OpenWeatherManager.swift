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
    
    func fetchToOpenWeather<T: Decodable>(api: OpenWeatherAPI, type: T.Type, completionHandler: @escaping (T?, Error?) -> Void) {
        AF.request(api.url, method: api.method, parameters: api.params).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success, nil)
            case .failure(let failure):
                completionHandler(nil, failure)
            }
        }
    }
}

//
//  Weather.swift
//  Weather
//
//  Created by SangRae Kim on 2/10/24.
//

import Foundation

struct WeatherInfo: Decodable {
    let name: String?
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let clouds: Clouds
    let dateTime: String?
    let coord: Coord?
    let city: City?
    
    enum CodingKeys: String, CodingKey {
        case name
        case weather
        case main
        case wind
        case clouds
        case dateTime = "dt_txt"
        case coord
        case city
    }
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Decodable {
    let temp: Double
    let feels: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feels = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}

struct Wind: Decodable {
    let speed: Double
}

struct Clouds: Decodable {
    let all: Int
}

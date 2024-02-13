//
//  City.swift
//  Weather
//
//  Created by SangRae Kim on 2/13/24.
//

import UIKit

struct City: Decodable {
    let id: Int
    let name: String
    let country: String
    let coord: Coord
}

struct Coord: Decodable {
    let lon: Double
    let lat: Double
}

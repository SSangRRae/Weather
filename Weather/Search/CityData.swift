//
//  CityData.swift
//  Weather
//
//  Created by SangRae Kim on 2/13/24.
//

import UIKit

class CityData {
    static let shared = CityData()
    private init() {}
    
    var originList: [City] = []
    var list: [City] = []
    
    func appendCityList() {
        guard
            let jsonData = load(),
            let userList = try? JSONDecoder().decode([City].self, from: jsonData)
        else { return }
        originList = userList
        list = userList
    }
    
    func load() -> Data? {
        let fileNm: String = "City"
        let extensionType = "json"
        
        guard let fileLocation = Bundle.main.url(forResource: fileNm, withExtension: extensionType) else { return nil }
        
        do {
            let data = try Data(contentsOf: fileLocation)
            return data
        } catch {
            return nil
        }
    }
}

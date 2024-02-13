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
    
    var list: [City] = []
    
    func appendCityList() {
        guard
            let jsonData = load(),
            let userList = try? JSONDecoder().decode([City].self, from: jsonData)
        else { return }
        list = userList
        print(list)
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

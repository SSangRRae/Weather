//
//  UIViewExtensions.swift
//  Weather
//
//  Created by SangRae Kim on 2/9/24.
//

import UIKit

extension UIView {
    func setBackGroundColor() {
        self.backgroundColor = ColorDesign.background.draw
    }
    
    func tempText(temp: Double) -> String {
        let temp = round(temp)
        return "\(String(format: "%.f", temp))°"
    }
    
    func dateTimeToHour(dateTime: String) -> String {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateTimeDate = format.date(from: dateTime)
        format.dateFormat = "HH시"
        if let dateTimeDate {
            let time = format.string(from: dateTimeDate)
            return time
        } else {
            return ""
        }
    }
}

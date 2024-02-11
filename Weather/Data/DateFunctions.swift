//
//  DateFunctions.swift
//  Weather
//
//  Created by SangRae Kim on 2/11/24.
//

import UIKit

class DateFunctions {
    let format = DateFormatter()
    
    func dateTimeFormattingToHour(_ dateTime: String?) -> String {
        guard let dateTime else {
            return ""
        }
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateTimeDate = format.date(from: dateTime)
        format.dateFormat = "HH"
        if let dateTimeDate {
            let hour = format.string(from: dateTimeDate)
            return hour
        } else {
            return ""
        }
    }
    
    func dateTimeFormattingToDay(_ dateTime: String?) -> String {
        guard let dateTime else {
            return ""
        }
        format.locale = Locale(identifier: "ko")
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateTimeDate = format.date(from: dateTime)
        format.dateFormat = "E"
        if let dateTimeDate {
            let day = format.string(from: dateTimeDate)
            return day
        } else {
            return ""
        }
    }
}

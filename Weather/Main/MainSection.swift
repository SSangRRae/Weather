//
//  MainSection.swift
//  Weather
//
//  Created by SangRae Kim on 2/9/24.
//

import UIKit

enum MainSection: CaseIterable {
    case now
    case threeTime
    case fiveDay
    case location
    case etc
    
    var numberOfRows: Int {
        switch self {
        case .now, .threeTime: 1
        case .fiveDay:
            1
        case .location:
            1
        case .etc:
            1
        }
    }
}

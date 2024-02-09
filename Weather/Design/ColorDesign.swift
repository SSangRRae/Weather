//
//  ColorDesing.swift
//  Weather
//
//  Created by SangRae Kim on 2/9/24.
//

import UIKit

enum ColorDesign {
    case background
    case text
    
    var draw: UIColor {
        switch self {
        case .background: UIColor.black
        case .text: UIColor.white
        }
    }
}

//
//  FontDesign.swift
//  Weather
//
//  Created by SangRae Kim on 2/9/24.
//

import UIKit

enum FontDesign: CGFloat {
    case smallest = 13
    case small
    case mid
    case big
    case biggest
    case info = 20
    case temp = 60
    
    var light: UIFont {
        return UIFont.systemFont(ofSize: self.rawValue)
    }
    
    var bold: UIFont {
        return UIFont.boldSystemFont(ofSize: self.rawValue)
    }
}

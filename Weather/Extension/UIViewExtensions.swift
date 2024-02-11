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
}

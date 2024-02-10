//
//  Protocols.swift
//  Weather
//
//  Created by SangRae Kim on 2/9/24.
//

import UIKit

@objc
protocol Configure {
    func configureHierarchy()
    @objc optional func configureViews()
    func configureConstraints()
}

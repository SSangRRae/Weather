//
//  ThreeTimeTableViewCell.swift
//  Weather
//
//  Created by SangRae Kim on 2/10/24.
//

import UIKit

class ThreeTimeTableViewCell: UITableViewCell {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setUICollectionViewLayout())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ThreeTimeTableViewCell {
    static func setUICollectionViewLayout()  -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 50, height: 200)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 8
        
        return layout
    }
}

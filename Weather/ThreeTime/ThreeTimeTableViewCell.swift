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
        
        collectionView.setBackGroundColor()
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(150)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ThreeTimeTableViewCell {
    static func setUICollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let space: CGFloat = 8
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth - (space * 6)
        
        layout.itemSize = CGSize(width: cellWidth/5, height: 150)
        layout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        layout.minimumLineSpacing = space
        layout.minimumInteritemSpacing = space
        layout.scrollDirection = .horizontal
        
        return layout
    }
}

//
//  EtcTableViewCell.swift
//  Weather
//
//  Created by SangRae Kim on 2/11/24.
//

import UIKit

class EtcTableViewCell: UITableViewCell {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setUICollectionViewLayout())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EtcTableViewCell {
    static func setUICollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let space: CGFloat = 16
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth - (space * 3)
        
        layout.itemSize = CGSize(width: cellWidth/2, height: cellWidth/2)
        layout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        layout.minimumLineSpacing = space
        layout.minimumInteritemSpacing = space
        
        return layout
    }
}

//
//  EtcCollectionViewCell.swift
//  Weather
//
//  Created by SangRae Kim on 2/11/24.
//

import UIKit

class EtcCollectionViewCell: UICollectionViewCell {
    let titleLabel: UILabel = {
        let view = UILabel()
        view.font = FontDesign.mid.light
        return view
    }()
    
    let valueLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 30)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EtcCollectionViewCell: Configure {
    func configureHierarchy() {
        addSubview(titleLabel)
        addSubview(valueLabel)
    }
    
    func configureViews(_ item: String, row: Int) {
        titleLabel.text = EtcSection.allCases[row].rawValue
        valueLabel.text = item
    }
    
    func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.horizontalEdges.equalToSuperview().inset(8)
            make.height.equalTo(22)
        }
        valueLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(8)
        }
    }
}

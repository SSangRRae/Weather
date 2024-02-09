//
//  MainView.swift
//  Weather
//
//  Created by SangRae Kim on 2/9/24.
//

import UIKit
import SnapKit

class MainView: UIView {
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView: Configure {
    func configureHierarchy() {
        addSubview(tableView)
    }
    
    func configureViews() {
        setBackGroundColor()
        tableView.backgroundColor = .black
    }
    
    func configureConstraints() {
        tableView.snp.makeConstraints { make in
            make.directionalEdges.equalTo(safeAreaLayoutGuide)
        }
    }
}

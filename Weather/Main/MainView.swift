//
//  MainView.swift
//  Weather
//
//  Created by SangRae Kim on 2/9/24.
//

import UIKit
import SnapKit

class MainView: UIView {
    let tableView = UITableView(frame: .zero, style: .grouped)
    let footer = UIView()
    let mapButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "map"), for: .normal)
        view.tintColor = .black
        return view
    }()
    let listButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        view.tintColor = .black
        return view
    }()
    
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
        addSubview(footer)
        footer.addSubview(mapButton)
        footer.addSubview(listButton)
    }
    
    func configureViews() {
        setBackGroundColor()
        tableView.backgroundColor = ColorDesign.background.draw
        tableView.separatorStyle = .none
        footer.backgroundColor = .white
    }
    
    func configureConstraints() {
        tableView.snp.makeConstraints { make in
            make.directionalEdges.equalTo(safeAreaLayoutGuide)
        }
        footer.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(60)
        }
        mapButton.snp.makeConstraints { make in
            make.leading.equalTo(footer.snp.leading).offset(24)
            make.centerY.equalToSuperview()
            make.size.equalTo(50)
        }
        listButton.snp.makeConstraints { make in
            make.trailing.equalTo(footer.snp.trailing).offset(-24)
            make.centerY.equalToSuperview()
            make.size.equalTo(50)
        }
    }
}

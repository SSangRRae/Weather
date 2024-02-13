//
//  SearchView.swift
//  Weather
//
//  Created by SangRae Kim on 2/13/24.
//

import UIKit

class SearchView: UIView {
    let searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "도시를 검색해보세요"
        return view
    }()
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackGroundColor()
        configureHierarchy()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchView: Configure {
    func configureHierarchy() {
        addSubview(searchBar)
        addSubview(tableView)
    }
    
    func configureConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.horizontalEdges.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    
}

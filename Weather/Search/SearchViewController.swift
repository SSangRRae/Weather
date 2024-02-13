//
//  SearchViewController.swift
//  Weather
//
//  Created by SangRae Kim on 2/13/24.
//

import UIKit

class SearchViewController: UIViewController {
    let searchView = SearchView()
    
    var pushData: ((String) -> Void)?
    
    override func loadView() {
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "City"
        searchView.tableView.delegate = self
        searchView.tableView.dataSource = self
        searchView.searchBar.delegate = self
        CityData.shared.appendCityList()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            CityData.shared.list = CityData.shared.originList
            searchView.tableView.reloadData()
            return
        }
        
        var tempList: [City] = []
        
        for list in CityData.shared.originList {
            if list.name.lowercased().contains(searchText.lowercased()) {
                tempList.append(list)
            }
        }
        CityData.shared.list = tempList
        searchView.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CityData.shared.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "result")
        
        cell.imageView?.image = UIImage(systemName: "number")
        cell.textLabel?.text = CityData.shared.list[indexPath.row].name
        cell.detailTextLabel?.text = CityData.shared.list[indexPath.row].country
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushData?("\(CityData.shared.list[indexPath.row].id)")
        navigationController?.popViewController(animated: true)
    }
}

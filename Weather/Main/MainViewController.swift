//
//  MainViewController.swift
//  Weather
//
//  Created by SangRae Kim on 2/9/24.
//

import UIKit

class MainViewController: UIViewController {
    let mainView = MainView()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(NowTableViewCell.self, forCellReuseIdentifier: "now")
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "now", for: indexPath) as! NowTableViewCell
        return cell
    }
}
